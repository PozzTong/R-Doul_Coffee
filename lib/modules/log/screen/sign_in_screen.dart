import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/save_token.dart';
import '../../../style/colors.dart';
import '../../home/nav_bar.dart';
import '../service/service_api.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController(),
      password = TextEditingController();
  bool _isPasswordVisible = false, isLoading = false, rememberme = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: mainBody(width, height),
    );
  }

  void _login(BuildContext context) async {
    setState(() {
      isLoading = true; // Start loading indicator
    });

    var connectivityResult = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No internet connection. Please check your connection and try again.',
          ),
        ),
      );
      setState(() {
        isLoading = false; // Stop loading indicator
      });
      return;
    }

    String username = email.text.trim();
    String passwords = password.text.trim();

    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.loading,
    //   title: 'Loading',
    //   text: 'Fetching your data',
    // );

    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(width: 16),
                const Text('Logging in...'),
              ],
            ),
          ),
        );
      },
    );

    // ignore: use_build_context_synchronously
    Api api = Provider.of<Api>(context, listen: false);
    Map? loginResponse = await api.login(username, passwords);

    // ignore: use_build_context_synchronously
    Navigator.pop(context); // Dismiss the login dialog

    if (loginResponse != null && loginResponse['success']) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      prefs.setString('loggedInUser', username);
      String accessToken = loginResponse['access_token'];
      await TokenStorage.saveToken(accessToken); //to save token

      // ignore: use_build_context_synchronously
      // Provider.of<NotificationProvider>(context, listen: false).fetchNotifications();

      Get.off(const BottomNavBar());
    } else {
      setState(() {
        isLoading = false; // Stop loading indicator
      });
      // QuickAlert.show(
      //     // ignore: use_build_context_synchronously
      //     context: context,
      //     type: QuickAlertType.error,
      //     title: 'Oops...',
      //     text: 'Invalid username or password.',
      //     confirmBtnColor: primaryColor);
      Get.snackbar('title', "message");
    }

    if (rememberme) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('rememberMe', true);
      prefs.setString('savedUsername', username);
      prefs.setString('savedPassword', passwords);
    }
    // await Provider.of<UserProviderTest>(context, listen: false).loadUser();
    // await Provider.of<NotificationProvider>(context, listen: false).fetchNotifications();
  }

  Widget mainBody(double width, double height) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: width,
            height: height / 5,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 70,
          left: 20,
          child: Text(
            "Let's get you Sign In!!!",
            style: TextStyle(
                color: white, fontSize: 20, fontFamily: 'Merriweather'),
          ),
        ),
        Positioned(
            top: height / 5 - 30,
            left: 25,
            right: 25,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              // child: Text('data'),
            )),
        Positioned(
          top: height / 5 - 30,
          left: 25,
          child: Container(
            height: 50,
            width: width / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: height / 3 - 30,
          left: 10,
          right: 10,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: width,
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    labelText: 'Email',
                    labelStyle: TextStyle(fontFamily: 'Merriweather'),
                    border: OutlineInputBorder(),
                    prefix: Icon(Icons.email),
                    fillColor: Colors.grey,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: width,
                child: TextFormField(
                  controller: password,
                  obscureText: !_isPasswordVisible,
                  obscuringCharacter: '#',
                  decoration: InputDecoration(
                    labelText: 'PassWord',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    labelStyle: const TextStyle(fontFamily: 'Merriweather'),
                    border: const OutlineInputBorder(),
                    prefix: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: _isPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    fillColor: Colors.grey,
                    filled: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot PassWord?',
                      style: TextStyle(
                        color: red,
                        fontFamily: 'Merriweather',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: GestureDetector(
                  onTap: () => _login(context),
                  child: Container(
                    height: 50,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 1.2,
                    color: Colors.black,
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Or Login With'),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1.2,
                    color: Colors.black,
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: width / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      color: primaryColor,
                      size: width / 7,
                    ),
                  ),
                  Container(
                    height: width / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      FontAwesomeIcons.googlePlusG,
                      color: red,
                      size: width / 6,
                    ),
                  ),
                  Container(
                    height: width / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    child: Icon(
                      Icons.apple,
                      size: width / 6,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width / 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () => Get.to(const SignUpScreen()),
                    child: const Text(
                      'Register Here',
                      style: TextStyle(color: red, fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
