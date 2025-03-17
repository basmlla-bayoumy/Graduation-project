import 'package:flutter/material.dart';

String ?uId ='';

 void showSnakBar(BuildContext context, String messsage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messsage)));
  }