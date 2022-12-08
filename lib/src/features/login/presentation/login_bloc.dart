import 'package:task_manager/task_manager.dart';

enum LoginField {
  identifier,
  password,
}

class LoginBloC extends BloC<LoginEvent> with RequiredStringStreamValidator {
  static const route = '/login';

  final LoginRepository repository;
  final SessionRepository sessionRepository;

  LoginBloC({
    required this.repository,
    required this.sessionRepository,
  });

  @override
  void onReady() {
    _setupRequiredFields();
    super.onReady();
  }

  String? get _identifier => map[LoginField.identifier];
  String? get _password => map[LoginField.password];

  void _dispatchIdentifier(String? value) {
    dispatch<String?>(value, key: LoginField.identifier);
  }

  void _dispatchPassword(String? value) {
    dispatch<String?>(value, key: LoginField.password);
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: LoginField.identifier,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: LoginField.password,
    );
  }

  @override
  void handleEvent(LoginEvent event) {
    if (event is DoLogin) {
      _doLogin();
    } else if (event is NavigateToRegister) {
      _navigateToRegister();
    }
  }

  bool get _credentialsIsValid {
    final isValid = _identifier.hasValue && _password.hasValue;

    if (!isValid) {
      _dispatchIdentifier(_identifier);
      _dispatchPassword(_password);
      showFailure('Preencha todos os campos');
    }

    return isValid;
  }

  void _doLogin() async {
    if (!_credentialsIsValid) {
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
    showSuccess('Usuário autenticado com sucesso!');
  }

  Future<void> saveSession(String token) async {
    SessionModel session = SessionModel(token: token);
    return sessionRepository.save(session);
  }

  void _navigateToRegister() {
    // toNamed(UserFormBloC.route);
  }
}
