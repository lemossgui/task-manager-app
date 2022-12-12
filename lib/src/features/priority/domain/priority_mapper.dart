import 'package:task_manager/task_manager.dart';

class PriorityMapper extends AbstractMapper<PriorityModel> {
  @override
  PriorityModel fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      id: map['id'],
      description: map['description'],
      key: map['key'],
    );
  }

  @override
  Map<String, dynamic> toMap(PriorityModel model) {
    return <String, dynamic>{
      'id': model.id,
      'description': model.description,
      'key': model.key,
    };
  }
}
