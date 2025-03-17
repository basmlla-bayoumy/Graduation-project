

import 'package:flutter/material.dart';
import 'package:g2/models/homepage2_model.dart';
import 'package:g2/widgets/custom_containers.dart';

class Imageslistview extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final  List <Homepage2Model> Outimages ;
  const Imageslistview({super.key, required this.Outimages});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding:  const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: Outimages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 1,
        ),
              itemBuilder: (context, index) {
                return CustomContainers(
                  homepage2model: Outimages[index],
                   index: index, 
                   images: Outimages,
                   
                );
              }),
        );
  }
}