import 'package:untitled5/domain/Entities/task.dart';

abstract class TaskRepository {
  Future<TaskDetailsEntity> getTaskDetails(int id);

}