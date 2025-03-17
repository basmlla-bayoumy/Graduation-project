import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:g2/models/words_model.dart';

class CustomWordsView extends StatelessWidget {
  const CustomWordsView({super.key, required this.wordsModel, required this.index, required this.images});
  final WordsModel wordsModel;
  final int index;
  final List<WordsModel>images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
  imageUrl: wordsModel.image ?? '',
  imageBuilder: (context, imageProvider) => Container(
                        height: MediaQuery.of(context).size.height * .40,
                        width: double.infinity,
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
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error, size: 25),
)
    );
  }
}




