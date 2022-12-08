import 'package:task_manager/task_manager.dart';

enum LoginField {
  identifier,
  password,
}

class LoginBloC extends BloC<LoginEvent> {
  static const route = '/login';

  final LoginRepository repository;
  final SessionRepository sessionRepository;

  LoginBloC({
    required this.repository,
    required this.sessionRepository,
  });

  @override
  void handleEvent(LoginEvent event) {
    if (event is DoLogin) {
      _doLogin();
    } else if (event is NavigateToRegister) {
      _navigateToRegister();
    }
  }

  String? get _identifier => map[LoginField.identifier];
  String? get _password => map[LoginField.password];

  bool get _credentialsIsValid {
    return _identifier != null && _password != null;
  }

  void _doLogin() async {
    if (!_credentialsIsValid) {
      showFailure('Preencha o campo de e-mail e senha');
      return;
    }

    await doPersist(
      action: () async {
        final credentials = CredentialsModel(
          identifier: _identifier!,
          password: _password!,
        );
        final result = await repository.doLogin(credentials: credentials);
        result.map(_handleLoginSuccess).mapError(showFailure);
      },
    );
  }

  void _handleLoginSuccess(String token) async {
    await saveSession(token);
    popToNamed(RootBloC.route);
    showSuccess('Sessão iniciada com sucesso!');
  }

  Future<void> saveSession(String token) async {
    SessionModel session = SessionModel(token: token);
    return sessionRepository.save(session);
  }

  void _navigateToRegister() {
    // toNamed(UserFormBloC.route);
  }
}
