import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // ignore: non_constant_identifier_names
      final ImageTemporary = File(image.path);
      setState(() {
        this.image = ImageTemporary;
      });
    } on PlatformException catch (e) {
      print(('Failed to pick Image:$e'));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           if(image != null)
                 Image.file(
                    image!,
                    height: 550,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                ,
            const SizedBox(
              height: 35,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: const Icon(FontAwesomeIcons.camera),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}


