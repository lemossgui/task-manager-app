import 'package:task_manager/task_manager.dart';

abstract class TaskFormEvent {}

class SaveTask extends TaskFormEvent {}

class UpdateTask extends TaskFormEvent {}
