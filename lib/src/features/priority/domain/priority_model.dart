import 'package:task_manager/task_manager.dart';

class PriorityModel extends Searchable {
  final int id;
  final String description;
  final String key;

  PriorityModel({
    required this.id,
    required this.description,
    required this.key,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'description': description});
    result.addAll({'key': key});

    return result;
  }

  factory PriorityModel.fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      key: map['key'] ?? '',
    );
  }

  static List<PriorityModel> listFromMap(List<dynamic> list) {
    return list.map((map) => PriorityModel.fromMap(map)).toList();
  }

  @override
  String get searchable => description;
}
