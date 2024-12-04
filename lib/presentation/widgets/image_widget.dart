import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import 'package:untitled5/presentation/widgets/sumbit_action_succsufl.dart';
import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';
import 'camer_widget.dart';
import 'custom_text_field.dart';

class ImageWidget extends StatelessWidget {
  final String actionItem;
  const ImageWidget({super.key, required this.actionItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                actionItem,
                style: StylesManager.bold(fontSize: AppFonts.font.large),
              ).paddingOnly(top: Sizes.size10, bottom: Sizes.size10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);  // Closing the current screen
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const CameraWidget(),
          const SizedBox(height: Sizes.size20),  // Space between camera and note
          Text('Note', style: StylesManager.bold(fontSize: AppFonts.font.large))
              .paddingOnly(top: Sizes.size10, bottom: Sizes.size10),
          const CustomTextInputField(
            maxLines: 5,
            autoFocus: false,
            label: 'Enter your note',
            type: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
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
      ),
    );
  }
}
