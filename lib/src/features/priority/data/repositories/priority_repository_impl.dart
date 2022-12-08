import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class PriorityRepositoryImpl implements PriorityRepository {
  final PriorityStore remote;

  PriorityRepositoryImpl({
    required this.remote,
  });

  @override
  AsyncResult<List<PriorityModel>, String> findAll() {
    return remote.findAll();
  }
}
