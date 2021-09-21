import 'dart:async';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'Register.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
               decoration: BoxDecoration(image: DecorationImage (image: AssetImage("assets/background_image.png"),fit: BoxFit.fill)),
             ),
          ],
        ),
      ),
    );
  }
}
