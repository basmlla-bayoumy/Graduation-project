import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          crossAxisAlignment:CrossAxisAlignment.end,
          children: [
            Text(
              'Edit Info',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      body:ElevatedButton.icon(
                  onPressed: () {
                   Get.back();
                  },
                  label: const Text('Edit'),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey, width: .9),
                      elevation: 13,
                      shadowColor: Colors.deepPurple.withOpacity(.9),
                      fixedSize: const Size(400, 90),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      textStyle:
                          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
    );
  }
}
