import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:g2/models/details_model.dart';

class InsideImageView extends StatelessWidget {
  InsideImageView({super.key, required this.detailsModel});
  final DetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (detailsModel.image != null) {
      imageBytes = base64Decode(detailsModel.image!);
    }
    return Column(
      children: [
        Container(
            alignment: Alignment.bottomRight,
            height: 300,
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
            ? Image.memory(
                imageBytes,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              )
            : Text('No image available'),
                ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, right: 8, left: 8),
          child: Container(
            alignment: Alignment.bottomRight,
            height: 75,
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
            child: Center(
              child: Text(
                detailsModel.text,
                style: TextStyle(fontSize: 55, color: Colors.purple.withOpacity(.9),
                fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
       SizedBox(
          height: 32,
        ),
        // ElevatedButton.icon(onPressed:(){},
        // icon: const Icon(Icons.music_note),
        //  label: const Text('Play Sound'),
        // style: ElevatedButton.styleFrom(
        //   side: const BorderSide(color: Colors.grey,width: .9),
        //   elevation: 13,
        //  shadowColor: Colors.deepPurple.withOpacity(.9),
        //  fixedSize: const Size(400,90),
        //  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        //  textStyle: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
        // ),
        // )
      
      ],
    );
  }
  }
