import 'package:task_manager/task_manager.dart';

class RootBloC extends BloC<RootEvent> {
  static const route = '/';

  final SessionRepository sessionRepository;

  RootBloC({
    required this.sessionRepository,
  });

  @override
  void onReady() async {
    await _checkSession();
    super.onReady();
  }

  Future<void> _checkSession() async {
    await Future.delayed(const Duration(seconds: 3));
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
