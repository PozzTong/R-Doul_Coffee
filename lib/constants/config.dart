import 'dart:ui';
import 'api_end_point.dart';

class Config {
  static final String baseUrl = ApiEndPoints.baseUrl;
  static int? userId;
  String clientId = '95',
      clientSecret = 'Ah3uCOiMHAtBbJIOY1XTrgkPss2gLWEW7uPI1IH0',
      copyright = '\u00a9',
      appName = 'app',
      version = 'V 1.7';
      
  final bool syncCallLog = true, showRegister = true, showFieldForce = false;

  static int quantityPrecision = 2,
      currencyPrecision = 2,
      callLogSyncDuration = 30;

  //List of locale language code
  List locale = [
    'en',
    'ar',
    'de',
    'fr',
    'es',
    'tr',
    'id',
    'my',
    'be',
    'ch',
    'it'
  ];
  String defaultLanguage = 'en';

  //List of locales included
  List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('ar', ''),
    Locale('de', ''),
    Locale('fr', ''),
    Locale('es', ''),
    Locale('tr', ''),
    Locale('id', ''),
    Locale('my', '')
  ];

  //dropdown items for changing language
  List<Map<String, dynamic>> lang = [
    {'languageCode': 'en', 'countryCode': 'US', 'name': 'English'},
    // {'languageCode': 'ar', 'countryCode': '', 'name': 'العربي'},
    // {'languageCode': 'de', 'countryCode': '', 'name': 'Deutsche'},
    {'languageCode': 'fr', 'countryCode': '', 'name': 'ខ្មែរ'},
    //   {'languageCode': 'es', 'countryCode': '', 'name': 'Española'},
    //   {'languageCode': 'tr', 'countryCode': '', 'name': 'Türkçe'},
    //   {'languageCode': 'id', 'countryCode': '', 'name': 'Indonesian'},
    // {'languageCode': 'be', 'countryCode': '', 'name': 'Bengali'},
    //   {'languageCode': 'ch', 'countryCode': '', 'name': 'chinese'},
    //   {'languageCode': 'it', 'countryCode': '', 'name': 'italian'},
    //   {'languageCode': 'my', 'countryCode': '', 'name': 'မြန်မာ'}
  ];

  final String googleAPIKey = 'AIzaSyDtorf5cQD5g7V4K2R0JVl8DcnnqiZS5Qw';
}
