import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class customTextFromField extends StatelessWidget {
  customTextFromField(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted,
      this.icon,
      required this.controller});

  String? hintText;
  Icon? icon;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  bool? obscureText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
             topRight: Radius.circular(15)),
        border: Border(
          top: BorderSide(color: Colors.grey.shade400),
          bottom: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) return 'field is required ';
          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: icon,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
