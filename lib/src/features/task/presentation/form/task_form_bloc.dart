import 'package:task_manager/task_manager.dart';

enum TaskFormKey {
  isEditing,
  title,
  description,
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

  void _dispatchCategory(CategoryModel? priority) {}

  void _dispatchPriority(PriorityModel? priority) {}

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

  void _onLoadAllCategoriesSuccess(List<CategoryModel> list) {
    dispatch<List<CategoryModel>>(list, key: TaskFormKey.categories);
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
  void handleEvent(TaskFormEvent event) {}
}
