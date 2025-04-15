// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_picker/image_picker.dart';

// class CameraPage extends StatefulWidget {
//   const CameraPage({super.key});

//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   File? image;

//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;

//       // ignore: non_constant_identifier_names
//       final ImageTemporary = File(image.path);
//       setState(() {
//         this.image = ImageTemporary;
//       });
//     } on PlatformException catch (e) {
//       print(('Failed to pick Image:$e'));
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//            if(image != null)
//                  Image.file(
//                     image!,
//                     height: 600,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   )
//                 ,
//             const SizedBox(
//               height: 35,
//             ),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   pickImage(ImageSource.camera);
//                 },
//                 style: ButtonStyle(
//                   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8))),
//                 ),
//                 child: const Icon(FontAwesomeIcons.camera),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ) ;
//   }
// }


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? cameraController;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      // Get the list of available cameras
      final cameras = await availableCameras();

      // Initialize the first camera (usually the back camera)
      cameraController = CameraController(
        cameras[0], // Use the first camera
        ResolutionPreset.high, // Set resolution to high
      );

      // Initialize the camera controller
      await cameraController!.initialize();

      // Check if the widget is still mounted
      if (!mounted) return;

      // Update the state to indicate the camera is initialized
      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print("Failed to initialize camera: $e");
    }
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      // Show a loading indicator while the camera is initializing
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Full-screen camera preview
          Positioned.fill(
            child: CameraPreview(cameraController!),
          ),

          // Optional: Add a button to take a picture
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () async {
                  try {
                    // Take a picture
                    final image = await cameraController!.takePicture();
                    print("Image saved: ${image.path}");
                  } catch (e) {
                    print("Failed to take picture: $e");
                  }
                },
                child: const Icon(Icons.camera),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
