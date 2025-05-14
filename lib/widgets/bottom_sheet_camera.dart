import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetCamera extends StatelessWidget {
  final Function(File?) onImagePicked;

  const BottomSheetCamera({super.key, required this.onImagePicked});

  Future<void> _takePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 85,
    );
    if (photo != null) {
      onImagePicked(File(photo.path));
      Navigator.pop(context);
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );
      if (image != null) {
        onImagePicked(File(image.path));
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // تم تصغير الارتفاع من 200 إلى 150
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16), // تم تقليل padding الرأسي
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'cameraBtn',
                  mini: true,
                  onPressed: () => _takePhoto(context),
                  child: const Icon(FontAwesomeIcons.camera, size: 20),
                ),
                const SizedBox(height: 8),
                const Text('Camera', style: TextStyle(fontSize: 14)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'galleryBtn',
                  mini: true,
                  onPressed: () => _pickImage(context),
                  child: const Icon(FontAwesomeIcons.image, size: 20),
                ),
                const SizedBox(height: 8),
                const Text('Gallery', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}