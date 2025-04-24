import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:g2/models/words_model.dart';

class CustomWordsView extends StatelessWidget {
  const CustomWordsView({super.key, required this.wordsModel, required this.index, required this.images});
  final WordsModel wordsModel;
  final int index;
  final List<WordsModel>images;

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (wordsModel.image != null) {
      imageBytes = base64Decode(wordsModel.image!);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
              alignment: Alignment.bottomRight,
              height: 360,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all( style: BorderStyle.solid,width: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.deepPurple.shade100.withOpacity(.1),
                        offset: const Offset(5, 4),
                        blurRadius: 5,
                        spreadRadius: 0),
                  ]),
                  child:  imageBytes != null
              ? Center(
                child: Image.memory(
                    imageBytes,
                    width: 300,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
              )
              : Text('No image available'),
                  ),
      ),
    );
  }
}




