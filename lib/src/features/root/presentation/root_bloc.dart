import 'package:task_manager/task_manager.dart';

class RootBloC extends BloC<RootEvent> {
  static const route = '/';

  final SessionRepository sessionRepository;

  RootBloC({
    required this.sessionRepository,
  });

  @override
  void onReady() {
    _checkSession();
    super.onReady();
  }

  void _checkSession() async {
    await Future.delayed(const Duration(seconds: 5));
    final isLogged = await sessionRepository.isLogged;
    if (isLogged) {
      popAndToNamed(HomeBloC.route);
    } else {
      popAndToNamed(LoginBloC.route);
    }
  }

  @override
  void handleEvent(RootEvent event) {}
}
