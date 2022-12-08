import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/src/features/select_color/select_color_injector.dart';
import 'package:task_manager/task_manager.dart';

Transition get _defaultTransition => Transition.rightToLeftWithFade;
Duration get _defaultTransitionDuration => const Duration(milliseconds: 300);
Curve get _defaultCurve => Curves.fastOutSlowIn;

List<Screen> routes = [
  Screen(
    name: RootBloC.route,
    page: () => const RootPage(),
    injector: RootInjector(),
  ),
  Screen(
    name: LoginBloC.route,
    page: () => const LoginPage(),
    injector: LoginInjector(),
  ),
  Screen(
    name: HomeBloC.route,
    page: () => const HomePage(),
    transition: _defaultTransition,
    transitionDuration: _defaultTransitionDuration,
    curve: _defaultCurve,
    injector: HomeInjector(),
  ),
  Screen(
    name: CategoryListBloC.route,
    page: () => const CategoryListPage(),
    injector: CategoryInjector(),
  ),
  Screen(
    name: CategoryFormBloC.route,
    page: () => const CategoryFormPage(),
    transition: _defaultTransition,
    transitionDuration: _defaultTransitionDuration,
    curve: _defaultCurve,
    injector: CategoryInjector(),
  ),
  Screen(
    name: SelectColorBloC.route,
    page: () => const SelectColorPage(),
    transition: _defaultTransition,
    transitionDuration: _defaultTransitionDuration,
    curve: _defaultCurve,
    injector: SelectColorInjector(),
  ),
];
