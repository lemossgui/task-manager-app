import 'package:task_manager/task_manager.dart';

enum UpdateEmailKey {
  id,
  email,
}

class UpdateEmailBloC extends BloC<UpdateEmailEvent>
    with RequiredStringStreamValidator {
  static const route = '/update-email';

  final UserRepository repository;

  UpdateEmailBloC({
    required this.repository,
  });

  int get _id => map[UpdateEmailKey.id];
  String? get _email => map[UpdateEmailKey.email];

  void _dispatchId(int value) {
    dispatch<int>(value, key: UpdateEmailKey.id);
  }

  void _dispatchEmail(String? value) {
    dispatch<String?>(value, key: UpdateEmailKey.email);
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
      key: UpdateEmailKey.email,
    );
  }

  void _fillForm() {
    final user = arguments as UserModel;
    _dispatchId(user.id);
    _dispatchEmail(user.email);
  }

  @override
  void handleEvent(UpdateEmailEvent event) {
    if (event is UpdateEmail) {
      _updateEmail();
    }
  }

  void _updateEmail() async {
    if (_email.isNullOrEmpty) {
      _dispatchEmail(_email);
      return;
    }

    showLoadingDialog(
      action: repository.updateEmail(_id, _email!),
      onComplete: (result) {
        result.map(_handleUpdateSuccess).mapError(showError);
      },
    );
  }

  void _handleUpdateSuccess(void _) {
    pop(result: true);
    showSuccess('E-mail alterado com sucesso!');
  }
}
