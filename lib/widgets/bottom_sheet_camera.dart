import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetCamera extends StatelessWidget {
  final Function(File?) onImagePicked;

  const BottomSheetCamera({super.key, required this.onImagePicked});

  Future<void> _takePhoto(ImagePicker picker, BuildContext context) async {
    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 85,
    );
    if (photo != null) {
      onImagePicked(File(photo.path));
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickImage(ImagePicker picker, BuildContext context) async {
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (image != null) {
        onImagePicked(File(image.path));
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('Image picker error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    
    return Container(
      height: 200,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
          child: Row(
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () => _takePhoto(picker, context),
                    child: Icon(FontAwesomeIcons.camera),
                  ),
                  Text('camera'),
                ],
              ),
              SizedBox(width: 35),
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () => _pickImage(picker, context),
                    child: Icon(FontAwesomeIcons.file),
                  ),
                  Text('Files')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}