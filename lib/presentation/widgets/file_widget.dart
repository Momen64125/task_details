import 'package:flutter/material.dart';
import '../../../config/theme/sizes_manager.dart';
import 'custom_text_field.dart';
import 'file_list.dart';
import 'sumbit_action_succsufl.dart';

class FileWidget extends StatefulWidget {
  final int scheduleId;
  final String actionType;
  final List<String>? media;

  const FileWidget({
    super.key,
    this.media,
    required this.actionType,
    required this.scheduleId,
  });

  @override
  _FileWidgetState createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    // You can send the data to a backend or process it here
    print('Files: ${widget.media}');

    // Navigate to success modal
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) {
        return const SumbitActionSuccsufl();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display the list of files
        FilesListWidget(
          fileKey: UniqueKey(),
          media: widget.media ?? [],
        ),

        // Note label and input field
        Text('Note', style: Theme.of(context).textTheme.headlineSmall),
        CustomTextInputField(
          maxLines: 5,
          autoFocus: false,
          controller: _controller,
          label: 'Add Note',
          type: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        ),

        // Submit button
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
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ),
        ),
      ],
    );
  }
}
