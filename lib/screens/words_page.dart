import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g2/models/words_model.dart';
import 'package:g2/screens/wordsListview.dart';
import 'package:g2/services/get_images.dart';

class WordsPage extends StatelessWidget {
  const WordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Learn',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Me',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: wordsListViewBulider(),
    );
  }
}





class wordsListViewBulider extends StatefulWidget {
  const wordsListViewBulider({
    super.key,
  });
  

  @override
  State<wordsListViewBulider> createState() => _wordsListViewBuliderState();
}

class _wordsListViewBuliderState extends State<wordsListViewBulider> {
  var future;
  void initState() {
    super.initState();
     future= Getimages(Dio()).getWords();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordsModel>>(
        future: future ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WordsListView(Wordsimages: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Text('oops try again ');
          }
          else {
            return  const Center(child: CircularProgressIndicator());
          }
        });
  }
}
