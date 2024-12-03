import 'package:flutter/material.dart';
import 'package:untitled5/presentation/widgets/sumbit_action_succsufl.dart';

import '../../config/theme/sizes_manager.dart';

class CheckIfOk extends StatefulWidget {
  final String question;
  final String optionText;

  const CheckIfOk({
    super.key,
    required this.question,
    required this.optionText,
  });

  @override
  State<CheckIfOk> createState() => _CheckIfOkState();
}

class _CheckIfOkState extends State<CheckIfOk> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Display the checkbox with the option text
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            Text(
              widget.optionText,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
          child: Container(
            width: double.infinity,
            height: Sizes.size48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size8),
              color: Colors.blueAccent,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                Navigator.pop(context);  // Closing the current screen

                // Show success modal
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (ctx) {
                    return const SumbitActionSuccsufl();
                  },
                );
              },
              child: const Text('Submit'),
            ),
          ),
        ),
      ],
    );
  }
}
