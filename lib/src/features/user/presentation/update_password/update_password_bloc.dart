import 'package:task_manager/task_manager.dart';

enum UpdatePasswordKey {
  id,
  oldPassword,
  oldPasswordVisibility,
  newPassword,
  newPasswordVisibility,
  newPasswordConfirmation,
  newPasswordConfirmationVisibility,
}

class UpdatePasswordBloC extends BloC<UpdatePasswordEvent>
    with RequiredStringStreamValidator {
  static const route = '/update-password';

  final UserRepository repository;

  UpdatePasswordBloC({
    required this.repository,
  });

  int get _id => map[UpdatePasswordKey.id];
  String? get _oldPassword => map[UpdatePasswordKey.oldPassword];
  String? get _newPassword => map[UpdatePasswordKey.newPassword];
  String? get _newPasswordConfirmation =>
      map[UpdatePasswordKey.newPasswordConfirmation];

  void _dispatchId(int value) {
    dispatch<int>(value, key: UpdatePasswordKey.id);
  }

  void _dispatchOldPassword(String? value) {
    dispatch<String?>(value, key: UpdatePasswordKey.oldPassword);
  }

  void _dispatchNewPassword(String? value) {
    dispatch<String?>(value, key: UpdatePasswordKey.newPassword);
  }

  void _dispatchNewPasswordConfirmation(String? value) {
    dispatch<String?>(value, key: UpdatePasswordKey.newPasswordConfirmation);
  }

  @override
  void onInit() {
    _setupRequiredFields();
    _fillForm();
    super.onInit();
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UpdatePasswordKey.oldPassword,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UpdatePasswordKey.newPassword,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: UpdatePasswordKey.newPasswordConfirmation,
    );
  }

  void _fillForm() {
    final id = arguments as int;
    _dispatchId(id);
  }

  @override
  void handleEvent(UpdatePasswordEvent event) {
    if (event is UpdatePassword) {
      _updatePassword();
    }
  }

  bool get _isValid {
    final isValid = _oldPassword.hasValue &&
        _newPassword.hasValue &&
        _newPasswordConfirmation.hasValue;

    if (!isValid) {
      _dispatchOldPassword(_oldPassword);
      _dispatchNewPassword(_newPassword);
      _dispatchNewPasswordConfirmation(_newPasswordConfirmation);
      showError('Preencha todos os campos');
    }

    return isValid;
  }

  bool get _passwordsIsValid {
    final passwordsIsEqual = _newPassword == _newPasswordConfirmation;

    if (!passwordsIsEqual) {
      showError('As senhas devem ser iguais');
    }

    return passwordsIsEqual;
  }

  void _updatePassword() async {
    if (!_isValid) {
      return;
    }

    if (!_passwordsIsValid) {
      return;
    }

    final action = repository.updatePassword(
      _id,
      _oldPassword!,
      _newPassword!,
      _newPasswordConfirmation!,
    );

    showLoadingDialog(
      action: action,
      onComplete: (result) {
        result.map(_handleUpdateSuccess).mapError(showError);
      },
    );
  }

  void _handleUpdateSuccess(void _) {
    pop(result: true);
    showSuccess('Senha alterada com sucesso!');
  }
}
