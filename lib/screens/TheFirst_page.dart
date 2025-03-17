import 'package:flutter/material.dart';
import 'package:g2/screens/homepage2.dart';
import 'package:g2/screens/words_page.dart';
import 'package:g2/widgets/first_custom_container.dart';

class ThefirstPage extends StatelessWidget {
  const ThefirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    First_costom_container(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH0oIzu5_Pok6ePvsBgxXXfVm0N23LIkdw7g&s',
                      title: 'الحروف ',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Homepage2();
                        }));
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    First_costom_container(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxnTqp22w8CKqauLmoBM40wpm37jCqBuTSxFnX2yC-w6C0sfV_pQtT2WvYinb2_W3YS3I&usqp=CAU',
                        title: 'الكلمات ',
                        onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WordsPage() ;
                        }));
                      },
                        ),
                  ],
                );
              }
              ),
    );
  }
}