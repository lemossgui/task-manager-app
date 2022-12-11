import 'package:task_manager/task_manager.dart';
import 'dart:developer';

enum UserFormKey {
  name,
  email,
  password,
  passwordVisibility,
  passwordConfirmation,
  passwordConfirmationVisibility,
}

class UserFormBloC extends BloC<UserFormEvent>
    with RequiredStringStreamValidator {
  static const route = '/user-form';

  final UserRepository repository;
  final LoginRepository loginRepository;
  final SessionRepository sessionRepository;

  UserFormBloC({
    required this.repository,
    required this.loginRepository,
    required this.sessionRepository,
  });

  int get _id => 0;
  String? get _name => map[UserFormKey.name];
  String? get _email => map[UserFormKey.email];
  String? get _password => map[UserFormKey.password];
  String? get _passwordConfirmation => map[UserFormKey.passwordConfirmation];

  void _dispatchName(String? value) {
    dispatch<String?>(value, key: UserFormKey.name);
  }

  void _dispatchEmail(String? value) {
    dispatch<String?>(value, key: UserFormKey.email);
  }

  void _dispatchPassword(String? value) {
    dispatch<String?>(value, key: UserFormKey.password);
  }

  void _dispatchPasswordConfirmation(String? value) {
    dispatch<String?>(value, key: UserFormKey.passwordConfirmation);
  }

  @override
  void onInit() {
    _setupRequiredFields();
    super.onInit();
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UserFormKey.name,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UserFormKey.email,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UserFormKey.password,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UserFormKey.passwordConfirmation,
    );
  }

  @override
  void handleEvent(UserFormEvent event) {
    if (event is SaveUser) {
      _saveUser();
    }
  }

  bool get _modelIsValid {
    final isValid = _name.hasValue &&
        _email.hasValue &&
        _password.hasValue &&
        _passwordConfirmation.hasValue;

    if (!isValid) {
      _dispatchName(_name);
      _dispatchEmail(_email);
      _dispatchPassword(_password);
      _dispatchPasswordConfirmation(_passwordConfirmation);
      showError('Preencha todos os campos');
    }

    return isValid;
  }

  bool get _passwordsIsValid {
    final passwordsIsEqual = _password == _passwordConfirmation;

    if (!passwordsIsEqual) {
      showError('As senhas devem ser iguais');
    }

    return passwordsIsEqual;
  }

  UserModel get _model {
    return UserModel(
      id: _id,
      name: _name!,
      email: _email!,
      password: _password!,
    );
  }

  void _saveUser() async {
    if (!_modelIsValid) {
      return;
    }

    if (!_passwordsIsValid) {
      return;
    }

    showLoadingDialog(
      action: repository.save(_model),
      onComplete: (result) {
        result.map(_handleSaveSuccess).mapError(showError);
      },
    );
  }

  void _handleSaveSuccess(String token) async {
    await saveSession(token);
    popAndToNamed(HomeBloC.route);
    showSuccess('Usuário cadastrado com sucesso!');
  }

  Future<void> saveSession(String token) async {
    SessionModel session = SessionModel(token: token);
    final result = await sessionRepository.save(session);
    result.map(log).mapError(showError);
    return;
  }
}
