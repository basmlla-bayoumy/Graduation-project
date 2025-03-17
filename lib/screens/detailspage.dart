
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g2/models/details_model.dart';
import 'package:g2/models/homepage2_model.dart';
import 'package:g2/screens/inside_image_view.dart';
import 'package:g2/services/get_images.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key, required this.images, required this.initialIndex});
  // final List<DetailsModel> insideimage;
  final List<Homepage2Model> images;
  final int initialIndex;

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
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),

        child: insideImageViewBulider(initialIndex: initialIndex,),
      ),
    );
  }
}

// ignore: camel_case_types
class insideImageViewBulider extends StatefulWidget {
  const insideImageViewBulider({
    super.key, required this.initialIndex,
  });
  final int initialIndex;

  @override
  State<insideImageViewBulider> createState() => _insideImageViewBuliderState();
}

// ignore: camel_case_types
class _insideImageViewBuliderState extends State<insideImageViewBulider> {
  late Future<List<DetailsModel>> futureDetails;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    futureDetails = Getimages(Dio()).getImages();
    _pageController =PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<DetailsModel>>(
        future: futureDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images available'));
          } else {
            final detailsImages = snapshot.data!;
            return PageView.builder(
              controller: _pageController,
              itemCount: detailsImages.length,
              itemBuilder: (context, index) {
                final detailsModel = detailsImages[index];
                return InsideImageView(detailsModel: detailsModel);
              },
            );
          }
        },
      );
  }
}






// Container(
//               padding: const EdgeInsets.all(8),
//               height: MediaQuery.of(context).size.height * .45,
//                 width:  MediaQuery.of(context).size.width * 0.99,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: .9),
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.shade300,
//                         offset: const Offset(5, 2),
//                         blurRadius: 5,
//                         spreadRadius: 0),
//                     const BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(-2, -4),
//                         blurRadius: 5,
//                         spreadRadius: 0)
//                   ],
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       'assets/Arabic Alph/أ.jpg',
//                     ),
//                   )),
//             ),