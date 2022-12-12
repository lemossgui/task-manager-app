import 'package:task_manager/task_manager.dart';

class UserMapper extends AbstractMapper<UserModel> {
  @override
  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      notificationIsEnable: map['notificationIsEnable'],
    );
  }

  @override
  Map<String, dynamic> toMap(UserModel model) {
    throw UnimplementedError();
  }
}
