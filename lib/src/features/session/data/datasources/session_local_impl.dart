import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/task_manager.dart';

class SessionLocalImpl implements SessionStore {
  final String _key = 'session';

  Future<SharedPreferences> get _box async {
    return SharedPreferences.getInstance();
  }

  @override
  AsyncResult<String, String> save(SessionModel model) async {
    try {
      await _box.then((sp) => sp.setString(_key, model.toJson()));
      return const Success('Sessão salva com sucesso!');
    } on Exception catch (_) {
      return const Error('Problema ao salvar a sessão');
    }
  }

  @override
  AsyncResult<SessionModel, String> get() async {
    try {
      return _box.then((sp) => sp.getString(_key)).then((json) {
        if (json != null) {
          return Success(SessionModel.fromJson(json));
        }
        return const Error('Problema ao obter a sessão');
      });
    } on Exception catch (_) {
      return const Error('Problema ao obter a sessão');
    }
  }

  @override
  AsyncResult<String, String> clear() async {
    try {
      await _box.then((value) => value.remove(_key));
      return const Success('Sessão encerrada com sucesso!');
    } on Exception catch (_) {
      return const Error('Problema ao encerrar a sessão');
    }
  }
}
