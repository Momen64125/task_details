import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import 'package:untitled5/presentation/widgets/sumbit_action_succsufl.dart';

import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';

class AnswerWidget extends StatefulWidget {
  final String question;
  final List<String> options;

  const AnswerWidget({
    super.key,
    required this.question,
    required this.options,
  });

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Answer Now",
              style: StylesManager.bold(fontSize: AppFonts.font.xXLarge),
            ).paddingOnly(top: Sizes.size10, bottom: Sizes.size10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  // Closing the current screen
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
        // Display the question
        Text(
          widget.question,
          style: StylesManager.bold(fontSize: AppFonts.font.large),
        ).paddingOnly(top: Sizes.size10, bottom: Sizes.size10),
        SizedBox(height: 16),

        // Display the options
        ...widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = index;
              });
            },
            child: Row(
              children: [
                Icon(
                  selectedOption == index
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: selectedOption == index ? Colors.blue[900] : Colors.grey,
                ),
                SizedBox(width: 8),
                Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }),

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
                    return SumbitActionSuccsufl();
                  },
                );
              },
              child: Text('Submit'),
            ),
          ),
        ),
      ],
    ).paddingAll( Sizes.size20);
  }
}
