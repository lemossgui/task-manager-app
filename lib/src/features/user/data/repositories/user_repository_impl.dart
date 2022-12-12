import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class UserRepositoryImpl implements UserRepository {
  final UserStore remote;

  UserRepositoryImpl({
    required this.remote,
  });

  @override
  AsyncResult<String, String> save(UserSaveModel model) {
    return remote.save(model);
  }

  @override
  AsyncResult<int, String> updateName(int id, String name) {
    return remote.updateName(id, name);
  }

  @override
  AsyncResult<int, String> updateEmail(int id, String email) {
    return remote.updateEmail(id, email);
  }

  @override
  AsyncResult<int, String> updatePassword(
    int id,
    String oldPassword,
    String newPassword,
    String newPasswordConfirmation,
  ) {
    return remote.updatePassword(
      id,
      oldPassword,
      newPassword,
      newPasswordConfirmation,
    );
  }

  @override
  AsyncResult<int, String> updateReceivingNotitication(
    int id,
    bool notificationIsEnable,
  ) {
    return remote.updateReceivingNotitication(id, notificationIsEnable);
  }

  @override
  AsyncResult<UserModel, String> getLoggedUser() {
    return remote.getLoggedUser();
  }
}
