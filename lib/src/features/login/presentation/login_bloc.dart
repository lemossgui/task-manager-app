import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

enum LoginKey {
  email,
  password,
  isPasswordVisible,
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
  void onInit() {
    _dispatchEmail('guilherme.lemos@rede.ulbra.br');
    _dispatchPassword('123456');
    _setupRequiredFields();
    super.onInit();
  }

  String? get _email => map[LoginKey.email];
  String? get _password => map[LoginKey.password];

  void _dispatchEmail(String? value) {
    dispatch<String?>(value, key: LoginKey.email);
  }

  void _dispatchPassword(String? value) {
    dispatch<String?>(value, key: LoginKey.password);
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: LoginKey.email,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: LoginKey.password,
    );
  }

  @override
  void handleEvent(LoginEvent event) {
    if (event is DoLogin) {
      _doLogin();
    } else if (event is NavigateToUserForm) {
      _navigateToUserForm();
    }
  }

  bool get _credentialsIsValid {
    final isValid = _email.hasValue && _password.hasValue;

    if (!isValid) {
      _dispatchEmail(_email);
      _dispatchPassword(_password);
      showError('Preencha todos os campos');
    }

    return isValid;
  }

  void _doLogin() async {
    if (!_credentialsIsValid) {
      return;
    }

    final credentials = CredentialsModel(
      email: _email!,
      password: _password!,
    );

    showLoadingDialog(
      action: repository.doLogin(credentials: credentials),
      onComplete: (result) {
        result.map(_handleLoginSuccess).mapError(showError);
      },
    );
  }

  void _handleLoginSuccess(String token) async {
    await saveSession(token);
    popAndToNamed(HomeBloC.route);
    showSuccess('Usuário autenticado com sucesso!');
  }

  Future<void> saveSession(String token) async {
    SessionModel session = SessionModel(token: token);
    final result = await sessionRepository.save(session);
    result.map(log).mapError(showError);
    return;
  }

  void _navigateToUserForm() {
    toNamed(UserFormBloC.route);
  }
}
