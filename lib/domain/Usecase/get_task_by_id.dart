import '../Entities/task.dart';
import '../Repository/task_repository.dart';

class GetTaskByIdUsecase {
  final TaskRepository taskRepository;

  GetTaskByIdUsecase({required this.taskRepository});
Future<TaskDetailsEntity>  execute(int id) async{


   return await taskRepository.getTaskDetails(id);

}
}