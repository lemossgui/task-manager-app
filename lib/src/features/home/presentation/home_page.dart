import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends ScreenView<HomeBloC> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.streamOf<int>(key: HomeKey.currentIndex),
      builder: ((context, snapshot) {
        final currentIndex = snapshot.data ?? 0;
        return Scaffold(
          body: SafeArea(
            child: _getPage(currentIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: backgroundColorDark,
            selectedItemColor: secondaryColor,
            unselectedItemColor: primaryColorLight,
            onTap: (index) {
              bloc.dispatch<int>(index, key: HomeKey.currentIndex);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Tarefas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_work),
                label: 'Categorias',
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text('Tarefas'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(secondaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Adicionar',
                      style: text.copyWith(
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 1:
        return const CategoryListPage();
      default:
        return Container();
    }
  }
}
