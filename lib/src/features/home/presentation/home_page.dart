import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends ScreenView<HomeBloC> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildPage() {
    return SafeArea(
      child: PageView(
        controller: bloc.pageController,
        children: const [
          ProfilePage(),
          TaskListPage(),
          CategoryListPage(),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return StreamBuilder<int>(
      stream: bloc.streamOf<int>(key: HomeKey.currentIndex),
      builder: (_, snapshot) {
        final currentIndex = snapshot.data ?? HomePages.tasks.index;
        return CircleNavBar(
          activeIcons: HomePages.values.map((item) {
            return Icon(
              item.icon,
              color: primaryColorDark,
            );
          }).toList(),
          inactiveIcons: HomePages.values.map((item) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  item.description,
                  style: text.semiBold.copyWith(
                    color: primaryTextColor,
                  ),
                ),
              ),
            );
          }).toList(),
          color: backgroundColor,
          height: 72.0,
          circleWidth: 64.0,
          activeIndex: currentIndex,
          onTap: (index) {
            bloc.dispatch<int>(index, key: HomeKey.currentIndex);
            bloc.pageController.jumpToPage(index);
          },
          shadowColor: Colors.grey.withOpacity(0.3),
          elevation: 10,
        );
      },
    );
  }
}
