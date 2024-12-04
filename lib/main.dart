import 'package:flutter/material.dart';
import 'package:untitled5/presentation/screens/task.dart';

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