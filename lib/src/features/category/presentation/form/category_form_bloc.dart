import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

enum CategoryFormKey {
  isEditing,
  id,
  description,
  colorKey,
}

class CategoryFormBloC extends BloC<CategoryFormEvent>
    with RequiredStringStreamValidator {
  static const route = '/category_form';

  final CategoryRepository repository;

  CategoryFormBloC({
    required this.repository,
  });

  int get _id => map[CategoryFormKey.id] ?? 0;
  String? get _description => map[CategoryFormKey.description];
  String? get _colorKey => map[CategoryFormKey.colorKey];

  void _dispatchId(int value) {
    dispatch<int>(value, key: CategoryFormKey.id);
  }

  void _dispatchDescription(String? value) {
    dispatch<String?>(value, key: CategoryFormKey.description);
  }

  void _dispatchColorKey(String? value) {
    dispatch<String?>(value, key: CategoryFormKey.colorKey);
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
      key: CategoryFormKey.description,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: CategoryFormKey.colorKey,
    );
  }

  void _fillForm() {
    final category = arguments as CategoryModel?;
    final isEditing = category != null;

    dispatch<bool>(isEditing, key: CategoryFormKey.isEditing);

    if (isEditing) {
      _dispatchId(category.id);
      _dispatchDescription(category.description);
      _dispatchColorKey(category.colorKey);
    }
  }

  @override
  void handleEvent(CategoryFormEvent event) {
    if (event is NavigateToSelectColor) {
      _navigateToSelectColor();
    } else if (event is SaveCategory) {
      _saveCategory();
    } else if (event is UpdateCategory) {
      _updateCategory();
    }
  }

  void _navigateToSelectColor() async {
    final colorKey = await toNamed(
      SelectColorBloC.route,
      arguments: _colorKey,
    );

    if (colorKey != null) {
      dispatch<String?>(colorKey, key: CategoryFormKey.colorKey);
    }
  }

  bool get _modelIsValid {
    final isValid = _description.hasValue && _colorKey.hasValue;

    if (!isValid) {
      _dispatchDescription(_description);
      _dispatchColorKey(_colorKey);
      showError('Preencha todos os campos');
    }

    return isValid;
  }

  CategoryModel get _model {
    return CategoryModel(
      id: _id,
      description: _description!,
      colorKey: _colorKey!,
    );
  }

  void _saveCategory() async {
    if (!_modelIsValid) {
      return;
    }

    showLoadingDialog(
      action: repository.save(_model),
      onComplete: (result) {
        result.map(_handleSaveSuccess).mapError(showError);
      },
    );
  }

  void _handleSaveSuccess(void _) {
    pop(result: true);
    showSuccess('Categoria cadastrada com sucesso!');
  }

  void _updateCategory() async {
    if (!_modelIsValid) {
      return;
    }

    showLoadingDialog(
      action: repository.update(_id, _model),
      onComplete: (result) {
        result.map(_handleUpdateSuccess).mapError(showError);
      },
    );
  }

  void _handleUpdateSuccess(void _) {
    pop(result: true);
    showSuccess('Categoria atualizada com sucesso!');
  }
}
