import 'package:flutter/material.dart';
import '../../config/theme/sizes_manager.dart';

class AppDefaultButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  // Constructor
  const AppDefaultButton({super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size48,
      width: 250,
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.size8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white), // Adding a style for the text
        ),
        onPressed: onPressed,
      ),
    );
  }
}
