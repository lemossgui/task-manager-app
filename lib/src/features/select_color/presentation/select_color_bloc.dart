import 'package:task_manager/task_manager.dart';

enum SelectColorKey {
  selected,
  list,
}

class SelectColorBloC extends BloC<SelectColorEvent> {
  static const route = '/select_color';

  final CategoryRepository categoryRepository;

  SelectColorBloC({
    required this.categoryRepository,
  });

  @override
  void onReady() async {
    await _dispatchColors();
    _dispatchSelectedColor();
    super.onReady();
  }

  Future<void> _dispatchColors() async {
    final result = await categoryRepository.findAll();
    result.map((categories) {
      final colorsInUse = categories.map((item) => item.color).toList();
      final availableColors = categoryColors
          .where((item) => !colorsInUse.contains(item.key))
          .toList();
      dispatch<List<CategoryColorItem>>(
        availableColors,
        key: SelectColorKey.list,
      );
    }).mapError(showError);
  }

  void _dispatchSelectedColor() {
    final selectedColor = arguments as String?;
    dispatch<String?>(selectedColor, key: SelectColorKey.selected);
  }

  @override
  void handleEvent(SelectColorEvent event) {
    if (event is SelectColor) {
      _selectColor(event.key);
    }
  }

  void _selectColor(String key) {
    pop(result: key);
  }
}
