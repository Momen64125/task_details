import '../../domain/Entities/task.dart';
import '../../domain/Repository/task_repository.dart';
import '../model/task_details.dart';

class TaskRepositoryImp implements TaskRepository {
  late final TaskDetailsModel taskDetailsModel;

  TaskRepositoryImp(this.taskDetailsModel);

  @override
  Future<TaskDetailsEntity> getTaskDetails(int id) {

    return Future.value(taskDetailsModel);
  }
}
