import 'package:task_manager/task_manager.dart';

enum ProfileKey {
  darkMode,
  receiveNotifications,
}

class ProfileBloC extends BloC<ProfileEvent> {
  static const route = '/profile';

  final SessionRepository sessionRepository;

  ProfileBloC({
    required this.sessionRepository,
  });

  @override
  void handleEvent(ProfileEvent event) {
    if (event is DoLogout) {
      _doLogout();
    }
  }

  void _doLogout() async {
    await sessionRepository.clear();
    popAndToNamed(LoginBloC.route);
  }
}
