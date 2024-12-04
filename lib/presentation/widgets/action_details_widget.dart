import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import '../../config/theme/sizes_manager.dart';
import 'action_item_widget.dart';

class ActionDetailsWidget extends StatelessWidget {
  final String status;
  final int scheduleId;
  final String action;

  const ActionDetailsWidget({
    required this.status,
    required this.action,
    required this.scheduleId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ActionItemWidget(
                status: status,
                action: action,
                showFullData: true,
              ),

            ],
          ).paddingSymmetric(horizontal: Sizes.size10),
        ),
      ),
    );
  }
}
