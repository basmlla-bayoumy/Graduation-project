import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class First_costom_container extends StatelessWidget {
   First_costom_container({
    super.key,
    required this.image,
    required this.title,
    required this.onTap
    
  });

  final String? image;
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CachedNetworkImage(
              imageUrl: image!,
              imageBuilder: (context, imageProvider) => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .26,
                        width: MediaQuery.of(context).size.width * 0.99,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: const Offset(5, 4),
                                  blurRadius: 5,
                                  spreadRadius: 0),
                              const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-2, -4),
                                  blurRadius: 5,
                                  spreadRadius: 0)
                            ],
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error)),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 45,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

