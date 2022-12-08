import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/task_manager.dart';

class SessionRepositoryImpl implements SessionRepository {
  final String _key = 'session';

  Future<SharedPreferences> get box async {
    return SharedPreferences.getInstance();
  }

  @override
  Future<void> clear() {
    return box.then((value) => value.remove(_key));
  }

  @override
  Future<SessionModel?> get() async {
    return box.then((value) {
      final json = value.getString(_key);
      if (json.isNullOrEmpty) return null;
      return SessionModel.fromJson(json!);
    });
  }

  @override
  Future<bool> get isLogged async {
    final session = await get();
    return session != null;
  }

  @override
  Future<void> save(SessionModel model) async {
    return box.then((value) => value.setString(_key, model.toJson()));
  }
}
