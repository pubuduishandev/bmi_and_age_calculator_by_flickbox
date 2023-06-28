import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_and_age_calculator/home.dart';
// ignore: unused_import
import 'package:bmi_and_age_calculator/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: 
      AnimatedSplashScreen(
        splash: 
        Image.asset(
          "assets/images/BMI_Logo.png",
          width: 200000,
        ),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition, //can be use rotationTransition, scaleTransition
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        nextScreen: MyHomePage(title: 'BMI Calculator')
      ),
    );
  }
}

