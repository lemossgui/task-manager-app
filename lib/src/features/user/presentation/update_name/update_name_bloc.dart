import 'package:task_manager/task_manager.dart';

enum UpdateNameKey {
  id,
  name,
}

class UpdateNameBloC extends BloC<UpdateNameEvent>
    with RequiredStringStreamValidator {
  static const route = '/update-name';

  final UserRepository repository;

  UpdateNameBloC({
    required this.repository,
  });

  int get _id => map[UpdateNameKey.id];
  String? get _name => map[UpdateNameKey.name];

  void _dispatchId(int value) {
    dispatch<int>(value, key: UpdateNameKey.id);
  }

  void _dispatchName(String? value) {
    dispatch<String?>(value, key: UpdateNameKey.name);
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
      key: UpdateNameKey.name,
    );
  }

  void _fillForm() {
    final user = arguments as UserModel;
    _dispatchId(user.id);
    _dispatchName(user.name);
  }

  @override
  void handleEvent(UpdateNameEvent event) {
    if (event is UpdateName) {
      _updateName();
    }
  }

  void _updateName() async {
    if (_name.isNullOrEmpty) {
      _dispatchName(_name);
      return;
    }

    showLoadingDialog(
      action: repository.updateName(_id, _name!),
      onComplete: (result) {
        result.map(_handleUpdateSuccess).mapError(showError);
      },
    );
  }

  void _handleUpdateSuccess(void _) {
    pop(result: true);
    showSuccess('Nome alterado com sucesso!');
  }
}
