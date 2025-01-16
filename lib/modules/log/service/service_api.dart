import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../../constants/api_end_point.dart';
import '../../../constants/config.dart';

class Api {
  // Configuration values
  final String baseUrl = Config.baseUrl;
  final String apiUrl = ApiEndPoints.apiUrl;
  final String clientId = Config().clientId;
  final String clientSecret = Config().clientSecret;

  // Validate the login details
  Future<Map<String, dynamic>?> login(String username, String password) async {
    final String url = ApiEndPoints.loginUrl;

    // Body of the POST request
    final Map<String, String> body = {
      'grant_type': 'password',
      'client_id': clientId,
      'client_secret': clientSecret,
      'username': username,
      'password': password,
    };

    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      // Parse the response
      final jsonResponse = convert.jsonDecode(response.body);
      print('Response: $jsonResponse');

      if (response.statusCode == 200) {
        // Logged in successfully
        return {
          'success': true,
          'access_token': jsonResponse['access_token'],
          'refresh_token': jsonResponse['refresh_token'],
          'expires_in': jsonResponse['expires_in'],
        };
      } else if (response.statusCode == 401) {
        // Invalid credentials
        return {'success': false, 'error': jsonResponse['error']};
      } else {
        // Handle other status codes
        return {'success': false, 'error': 'Unexpected error occurred'};
      }
    } catch (e) {
      // Handle errors
      print('Login error: $e');
      return {'success': false, 'error': 'Network or server error'};
    }
  }

  // Generate headers for authenticated requests
  Map<String, String> _getHeader(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Refresh access token
  Future<Map<String, dynamic>?> _refreshToken(String refreshToken) async {
    final String url = '$baseUrl/oauth/token';

    // Body for the refresh token request
    final Map<String, String> body = {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': clientId,
      'client_secret': clientSecret,
    };

    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      // Parse the response
      final jsonResponse = convert.jsonDecode(response.body);
      print('Refresh Token Response: $jsonResponse');

      if (response.statusCode == 200) {
        // Token refreshed successfully
        return {
          'success': true,
          'access_token': jsonResponse['access_token'],
          'refresh_token': jsonResponse['refresh_token'],
          'expires_in': jsonResponse['expires_in'],
        };
      } else {
        // Handle other status codes
        return {'success': false, 'error': jsonResponse['error']};
      }
    } catch (e) {
      // Handle errors
      print('Refresh token error: $e');
      return {'success': false, 'error': 'Network or server error'};
    }
  }
}
