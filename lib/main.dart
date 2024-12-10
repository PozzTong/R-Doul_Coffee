import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home_screen.dart';

void main() {
  runApp(
      // MultiProvider(),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "R'Doul Coffee",
      theme: ThemeData(
          useMaterial3: true,
          // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface)
          ),
      
      home: const MyHomePage(),
    );
  }
}
