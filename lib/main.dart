import 'package:flutter/material.dart';
import 'package:untitled5/presentation/screens/task.dart';
import 'package:untitled5/presentation/widgets/action_list_widget.dart';
import 'package:untitled5/presentation/widgets/tast_detlis_widget.dart';

import 'config/theme/theme_manager.dart';
import 'data/Repository/task_repository_imp.dart';
import 'data/model/task_details.dart';
import 'domain/Entities/task.dart';
import 'domain/Repository/task_repository.dart';
import 'domain/Usecase/get_task_by_id.dart';

void main()async {

  // late TaskDetailsModel taskDetailsModel = TaskDetailsModel(actions: [ 'Take a Photo' , 'Take a Photo', 'Take a Photo'], id: 1, name: 'Take a Photo');
  // TaskRepository taskRepository = TaskRepositoryImp(taskDetailsModel);
  // TaskDetailsEntity taskDetailsEntity = await GetTaskByIdUsecase(taskRepository: taskRepository).execute(1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {

       // final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

        return MaterialApp(
         // theme: isDarkMode ? ThemeManager.getDarkMode() : ThemeManager.getLightMode(),
          title: 'Flutter Demo',
          home:  Task( ),
        );
      },
    );
  }
}