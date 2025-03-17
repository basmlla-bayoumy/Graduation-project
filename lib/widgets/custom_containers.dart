import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/cubit/learn_me_cubit.dart';
import 'package:g2/models/homepage2_model.dart';
import 'package:g2/screens/detailspage.dart';

class CustomContainers extends StatelessWidget {
  const CustomContainers({super.key, required this.homepage2model, required this.index, required this.images});
  final Homepage2Model homepage2model;
  final int index;
  final List<Homepage2Model>images;

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (homepage2model.image != null) {
      imageBytes = base64Decode(homepage2model.image!);
    }
    return BlocConsumer<LearnMeCubit, LearnMeState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var homepage2model=LearnMeCubit.get(context).model;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailspage(
              initialIndex: index,
               images:images,
            ),
          ),
        );
            },
            child: imageBytes != null
            ? Image.memory(
                imageBytes,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
            : const Text('No image available'),
    
          ),
        );
      },
    );
  }
}





// CachedNetworkImage(
//               imageUrl: homepage2model.image??'',
//               imageBuilder: (context, imageProvider) => Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                       ),
//                 ),
//               ),
//               placeholder: (context, url) => const CircularProgressIndicator(),
//               errorWidget: (context, url, error) => const Icon(Icons.error,size: 25,),
//             ),

// Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 3),
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.shade500,
//                         offset: Offset(5, 4),
//                         blurRadius: 5,
//                         spreadRadius: 0),
//                     const BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(-2, -4),
//                         blurRadius: 5,
//                         spreadRadius: 0)
//                   ],
//                   image: DecorationImage(image: 
//                   CachedNetworkImage(imageUrl: imageUrl))
//                   ),
//             ),