import 'package:flutter/material.dart';
import 'package:g2/models/words_model.dart';
import 'package:g2/widgets/custom_words_view.dart';

class WordsListView extends StatelessWidget {
  const WordsListView({super.key, required this.Wordsimages});
  final  List <WordsModel> Wordsimages ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder
        (itemCount:Wordsimages.length,
        itemBuilder: (context, index) {
          return CustomWordsView(wordsModel: Wordsimages[index],
           index: index,
            images: Wordsimages,);
        },
        
        );
    
    
    
    
    
    
  
  }
}
