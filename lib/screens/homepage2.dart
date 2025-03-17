import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g2/models/homepage2_model.dart';
import 'package:g2/screens/imagesListView.dart';
import 'package:g2/services/get_images.dart';

class Homepage2 extends StatelessWidget {
  const Homepage2({super.key});

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
        body: const imageListViewBulider());
  }
}

// ignore: camel_case_types
class imageListViewBulider extends StatefulWidget {
  const imageListViewBulider({
    super.key,
  });
  

  @override
  State<imageListViewBulider> createState() => _imageListViewBuliderState();
}

// ignore: camel_case_types
class _imageListViewBuliderState extends State<imageListViewBulider> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
     future= Getimages(Dio()).getOutImages();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Homepage2Model>>(
        future: future ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Imageslistview(Outimages: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Text('oops try again ');
          }
          else {
            return  const Center(child: CircularProgressIndicator());
          }
        });
  }
}

