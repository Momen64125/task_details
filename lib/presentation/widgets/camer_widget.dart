import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled5/config/theme/sizes_manager.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

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
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1D42FF),
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
        const SizedBox(width: Sizes.size10),

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
