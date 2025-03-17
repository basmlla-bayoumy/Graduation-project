import 'dart:async';

import 'package:flutter/material.dart';
import 'package:g2/screens/firstpage.dart';
import 'package:get/get.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
       Get.offAll(()=> const Firstpage());
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
