import 'package:task_manager/task_manager.dart';

enum TaskFormKey {
  isEditing,
  title,
  description,
  startDate,
  endDate,
  categories,
  category,
  priorities,
  priority,
}

class TaskFormBloC extends BloC<TaskFormEvent> {
  static const route = '/task_form';

  final CategoryRepository categoryRepository;
  final PriorityRepository priorityRepository;

  TaskFormBloC({
    required this.categoryRepository,
    required this.priorityRepository,
  });

  void _dispatchStartDate(DateTime? value) {
    dispatch<DateTime?>(value, key: TaskFormKey.startDate);
  }

  void _dispatchEndDate(DateTime? value) {
    dispatch<DateTime?>(value, key: TaskFormKey.endDate);
  }

  void _dispatchCategory(CategoryModel? value) {}

  void _dispatchPriority(PriorityModel? value) {}

  @override
  void onReady() async {
    await _loadAllCategories();
    await _loadAllPriorities();
    _fillForm();
    super.onReady();
  }

  Future<void> _loadAllCategories() async {
    final result = await categoryRepository.findAll();
    result.map(_onLoadAllCategoriesSuccess).mapError(showError);
  }

  void _onLoadAllCategoriesSuccess(List<CategoryModel> list) async {
    if (list.isEmpty) {
      await dialog(
        const InfoDialog(
          message: 'Você precisa ter ao menos uma categoria cadastrada.'
              ' Retorne à tela de categorias e cadastre uma para prosseguir.',
        ),
      );
      pop();
    } else {
      dispatch<List<CategoryModel>>(list, key: TaskFormKey.categories);
    }
  }

  Future<void> _loadAllPriorities() async {
    final result = await priorityRepository.findAll();
    result.map(_onLoadAllPrioritiesSuccess).mapError(showError);
  }

  void _onLoadAllPrioritiesSuccess(List<PriorityModel> list) {
    dispatch<List<PriorityModel>>(list, key: TaskFormKey.priorities);
  }

  void _fillForm() {
    final task = arguments as TaskModel?;
    final isEditing = task != null;

    dispatch<bool>(isEditing, key: TaskFormKey.isEditing);

    if (isEditing) {}
  }

  @override
  void handleEvent(TaskFormEvent event) {
    if (event is SelectStartDate) {
      _selectStartDate();
    } else if (event is SelectEndDate) {
      _selectEndDate();
    }
  }

  void _selectStartDate() async {
    final date = await dialog(
      DateTimePickerDialog(),
    ) as DateTime?;

    _dispatchStartDate(date);
  }

  void _selectEndDate() async {
    final date = await dialog(
      DateTimePickerDialog(),
    ) as DateTime?;

    _dispatchEndDate(date);
  }
}
