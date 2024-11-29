import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3),(timer) {
      Navigator.of(context).pushReplacementNamed('/home');
    },);
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/15616077.png'),
      ),
    );
  }
}
