import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

enum HomeKey {
  currentIndex,
}

enum HomePages {
  profile('Perfil', Icons.person),
  tasks('Tarefas', Icons.task),
  categories('Categorias', Icons.group_work);

  final String description;
  final IconData icon;

  const HomePages(this.description, this.icon);
}

class HomeBloC extends BloC<HomeEvent> {
  static const route = '/home';

  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: HomePages.tasks.index);
    super.onInit();
  }

  @override
  void handleEvent(HomeEvent event) {}

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
