import 'package:task_manager/task_manager.dart';
import 'package:get/get.dart';

extension AbstractModelFunctions<T extends AbstractModel> on List<T> {
  T? firstWhereOrNullById(String? uuid) {
    return firstWhereOrNull((item) => item.uuid == uuid);
  }
}
