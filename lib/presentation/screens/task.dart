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
      actions: ['Take a Photo', 'Answer now', 'Check if Ok'],
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
            // التعامل مع الأخطاء
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // البيانات جاهزة
            final taskDetails = snapshot.data!;
            return Column(
              children: [
                // تمرير البيانات إلى TaskDetailsWidget
                TaskDetailsWidget(
                  task: taskDetails.name,
                  status: 'In Progress',
                  doneActionsCount: 3,
                  totalActionsCount: taskDetails.actions.length,
                ),
                // تمرير قائمة الأفعال إلى ActionList
                ActionList(
                  status: 'In Progress',
                  scheduleId: taskDetails.id,
                  actionList: taskDetails.actions,
                ),
              ],
            ).paddingAll(Sizes.size10);
          } else {
            // في حال عدم وجود بيانات
            return const Center(child: Text('No data available.'));
          }
        },
      ),

    );
  }
}
