// ignore: unused_import
// ignore_for_file: avoid_unnecessary_containers

// ignore: unused_import
import 'package:bmi_and_age_calculator/main.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key, required IconData splash}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (context)=> MyHomePage(
            title: 'BMI Calculator' ,
          )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:500, 
              width: 500, 
              color:Colors.black,
            ),
          ],
        ),
      ),
    );

  }
}
