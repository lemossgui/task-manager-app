import 'package:task_manager/task_manager.dart';

abstract class SessionRepository {
  Future<void> clear();
  Future<SessionModel?> get();
  Future<bool> get isLogged;
  Future<void> save(SessionModel model);
}
