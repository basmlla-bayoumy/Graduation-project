import 'dart:async';

import 'package:flutter/material.dart';
import 'package:g2/screens/loginpage.dart';
import 'package:get/get.dart';


class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
       Get.to(()=>Loginpage());
    });
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'LearnMe ',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ),
    );
  }
}