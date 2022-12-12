import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

abstract class UserStore {
  AsyncResult<String, String> save(UserSaveModel model);
  AsyncResult<int, String> updateName(int id, String name);
  AsyncResult<int, String> updateEmail(int id, String email);
  AsyncResult<int, String> updatePassword(
    int id,
    String oldPassword,
    String newPassword,
    String newPasswordConfirmation,
  );
  AsyncResult<int, String> updateReceivingNotitication(
      int id, bool notificationIsEnable);
  AsyncResult<UserModel, String> getLoggedUser();
}
