import 'package:task_manager/task_manager.dart';

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
    injector: HomeInjector(),
  ),
];
