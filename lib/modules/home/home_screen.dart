import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpro/style/colors.dart';

import '../log/sign_in_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height / 2 + 30,
            right: 0,
            left: 0,
            child: const Column(
              children: [
                Text(
                  'Welcome To',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Merriweather',
                  ),
                ),
                Text(
                  "R'Doul Coffee",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather',
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            // bottom: 0,
            child: Container(
              width: width,
              height: height / 2,
              decoration: const BoxDecoration(
                // color: white,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/background/q.png',
                  ),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 50,
            left: 50,
            child: GestureDetector(
              onTap: () => Get.to(const SignInScreen()),
              child: Container(
                width: width / 3,
                height: 50,
                // color: primaryColor,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: const Center(
                    child: Text(
                  'Get Start',
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather',
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
