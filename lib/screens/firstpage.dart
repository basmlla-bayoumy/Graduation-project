
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/cubit/learn_me_cubit.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LearnMeCubit, LearnMeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LearnMeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar( 
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
             elevation: 0,
            title:Text(
              cubit.Titles[cubit.currentIndex],

               style: const TextStyle(fontSize: 25,
               fontWeight: FontWeight.bold,
               color: Colors.purple),
            )
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.house), label: 'Home'),
                    BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.solidMessage), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.gear), label: 'Setting')
              ],
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.deepPurple.withOpacity(.4),
              elevation: 1.0,
              backgroundColor: Colors.white),

        );
      },
    );
  }
}


// class First_costom_container extends StatelessWidget {
//   First_costom_container({
//     super.key,
//     required this.image,
//     required this.title,
//   });

//   final String? image;
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           CachedNetworkImage(
//               imageUrl: image!,
//               imageBuilder: (context, imageProvider) => Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return Homepage2();
//                         }));
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * .26,
//                         width: MediaQuery.of(context).size.width * 0.99,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 3),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade500,
//                                   offset: Offset(5, 4),
//                                   blurRadius: 5,
//                                   spreadRadius: 0),
//                               const BoxShadow(
//                                   color: Colors.white,
//                                   offset: Offset(-2, -4),
//                                   blurRadius: 5,
//                                   spreadRadius: 0)
//                             ],
//                             image: DecorationImage(
//                               image: imageProvider,
//                               fit: BoxFit.cover,
//                             )),
//                       ),
//                     ),
//                   ),
//               placeholder: (context, url) => CircularProgressIndicator(),
//               errorWidget: (context, url, error) => Icon(Icons.error)),
//           Padding(
//             padding: const EdgeInsets.only(top: 2.0),
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 45,
//                 color: Colors.indigo,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

