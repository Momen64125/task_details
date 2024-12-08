import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import '../../config/theme/sizes_manager.dart';
import '../../data/Repository/task_repository_imp.dart';
import '../../data/model/task_details.dart';
import '../../domain/Entities/task.dart';
import '../../domain/Repository/task_repository.dart';
import '../../domain/Usecase/get_task_by_id.dart';
import '../widgets/action_list_widget.dart';
import '../widgets/tast_detlis_widget.dart';

class Task extends StatelessWidget {

  final TaskRepository taskRepository = TaskRepositoryImp(
    TaskDetailsModel(
      actions: ['Take a Photo', 'Answer now', 'Check if Ok','Upload File'],
      // id: 1,
      // name: 'Take a Photo',
    ),
  );

  Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: FutureBuilder<TaskDetailsEntity>(
        future: GetTaskByIdUsecase(taskRepository: taskRepository).execute(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {

            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {

            final taskDetails = snapshot.data!;
            return Column(
              children: [

                TaskDetailsWidget(
                  task: taskDetails.name,
                  status: taskDetails.status,
                  doneActionsCount: 3,
                  totalActionsCount: taskDetails.actions.length,
                ),

                ActionList(
                  status: taskDetails.status,
                  scheduleId: taskDetails.id,
                  actionList: taskDetails.actions,
                ),
              ],
            ).paddingAll(Sizes.size10);
          } else {

            return const Center(child: Text('No data available.'));
          }
        },
      ),

    );
  }
}
