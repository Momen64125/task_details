import '../../domain/Entities/task.dart';
import '../../domain/Repository/task_repository.dart';
import '../model/task_details.dart';

class TaskRepositoryImp implements TaskRepository {
  late final TaskDetailsModel taskDetailsModel;

  TaskRepositoryImp(this.taskDetailsModel); // التهيئة هنا

  @override
  Future<TaskDetailsEntity> getTaskDetails(int id) {
    // إذا كنت تحتاج لمزيد من المعالجة بناءً على id، قم بإضافتها هنا
    return Future.value(taskDetailsModel);
  }
}
