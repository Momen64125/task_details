import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import 'package:untitled5/presentation/widgets/sumbit_action_succsufl.dart';

import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Check if Ok',
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

        Text(
          widget.question,
          style: StylesManager.bold(fontSize: AppFonts.font.large),
        ).paddingOnly(top: Sizes.size10, bottom: Sizes.size4),



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
          padding: const EdgeInsets.all(Sizes.size20),
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
                Navigator.pop(context);


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
    ).paddingAll(Sizes.size20);
  }
}
