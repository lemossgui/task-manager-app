import 'package:task_manager/task_manager.dart';

enum CategoryFormKey {
  isEditing,
  id,
  description,
  color,
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
  String? get _color => map[CategoryFormKey.color];

  void _dispatchId(int value) {
    dispatch<int>(value, key: CategoryFormKey.id);
  }

  void _dispatchDescription(String? value) {
    dispatch<String?>(value, key: CategoryFormKey.description);
  }

  void _dispatchColor(String? value) {
    dispatch<String?>(value, key: CategoryFormKey.color);
  }

  @override
  void onReady() {
    _setupRequiredFields();
    _fillForm();
    super.onReady();
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: CategoryFormKey.description,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: CategoryFormKey.color,
    );
  }

  void _fillForm() {
    final category = arguments as CategoryModel?;
    final isEditing = category != null;

    dispatch<bool>(isEditing, key: CategoryFormKey.isEditing);

    if (isEditing) {
      _dispatchId(category.id);
      _dispatchDescription(category.description);
      _dispatchColor(category.color);
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
    final color = await toNamed(
      SelectColorBloC.route,
      arguments: _color,
    );

    if (color != null) {
      dispatch<String?>(color, key: CategoryFormKey.color);
    }
  }

  bool get _modelIsValid {
    final isValid = _description.hasValue && _color.hasValue;

    if (!isValid) {
      _dispatchDescription(_description);
      _dispatchColor(_color);
      showError('Preencha todos os campos');
    }

    return isValid;
  }

  CategoryModel get _model {
    return CategoryModel(
      id: _id,
      description: _description!,
      color: _color!,
    );
  }

  void _saveCategory() async {
    if (!_modelIsValid) {
      return;
    }

    await doPersist(
      action: () async {
        final result = await repository.save(_model);
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

    await doPersist(
      action: () async {
        final result = await repository.update(_id, _model);
        result.map(_handleUpdateSuccess).mapError(showError);
      },
    );
  }

  void _handleUpdateSuccess(void _) {
    pop(result: true);
    showSuccess('Categoria atualizada com sucesso!');
  }
}
