import 'package:task_manager/task_manager.dart';

class UserSaveMapper extends AbstractMapper<UserSaveModel> {
  @override
  UserSaveModel fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap(UserSaveModel model) {
    return <String, dynamic>{
      'id': model.id,
      'name': model.name,
      'email': model.email,
      'password': model.password,
    };
  }
}
