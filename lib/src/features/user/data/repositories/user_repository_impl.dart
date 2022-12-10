import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class UserRepositoryImpl implements UserRepository {
  final UserStore remote;

  UserRepositoryImpl({
    required this.remote,
  });

  @override
  AsyncResult<int, String> save(UserModel model) {
    return remote.save(model);
  }
}
