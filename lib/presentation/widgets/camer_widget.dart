// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CameraWidget extends StatefulWidget {
//   @override
//   _CameraWidgetState createState() => _CameraWidgetState();
// }
//
// class _CameraWidgetState extends State<CameraWidget> {
//   File? _capturedImage;
//
//   Future<void> _openCamera() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       setState(() {
//         _capturedImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     double buttonSize = screenWidth * 0.2;
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           width: buttonSize,
//           height: buttonSize,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//             onPressed: _openCamera,
//             child: const Icon(
//               Icons.camera_alt_rounded,
//               size: 24.0,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(width: 10.0),
//         if (_capturedImage != null)
//           Container(
//             width: buttonSize,
//             height: buttonSize,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               image: DecorationImage(
//                 image: FileImage(_capturedImage!),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File? _capturedImage;

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _capturedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle error or show a message if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to capture image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonSize = screenWidth * 0.2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Camera Button
        Container(
          width: buttonSize,
          height: buttonSize,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _openCamera,
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10.0),

        // Display Captured Image
        if (_capturedImage != null)
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey, width: 1.0),
              image: DecorationImage(
                image: FileImage(_capturedImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
