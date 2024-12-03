import 'package:flutter/material.dart';
import 'package:untitled5/presentation/widgets/precentage_widget.dart';
import 'package:untitled5/presentation/widgets/status_widget.dart';

class TaskDetailsWidget extends StatelessWidget {
  final String status;
  final int doneActionsCount;
  final int totalActionsCount;
  final String task;

   const TaskDetailsWidget({
    super.key,
    required this.task,
    required this.status,
    required this.doneActionsCount,
    required this.totalActionsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4,
              offset: const Offset(4, 8), // Shadow position
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),

        constraints: const BoxConstraints(
          minWidth: 210.0,
          maxWidth: 350.0,
          minHeight: 100.0,
          maxHeight: 200.0,
        ),

        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                StatusWidget(status: status),
                const SizedBox(height: 10.0),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'project name',
                          style: TextStyle(color:Colors.black),
                        ),
                        Text(
                         'UX Consultation',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black,
                          fontSize: 30,

                          ),
                        ),
                      ],
                    ),
                    PercentageWidget(
                      color: Colors.green,
                      percent: 0.8,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                Text(
                  '$totalActionsCount/$doneActionsCount Tasks completed',
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
