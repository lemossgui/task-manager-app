import 'package:task_manager/task_manager.dart';

enum ProfileKey {
  user,
  id,
  name,
  email,
  darkMode,
  notificationIsEnable,
}

class ProfileBloC extends BloC<ProfileEvent> {
  static const route = '/profile';

  final UserRepository userRepository;
  final SessionRepository sessionRepository;

  ProfileBloC({
    required this.userRepository,
    required this.sessionRepository,
  });

  UserModel get _user => map[ProfileKey.user];
  int get _id => map[ProfileKey.id];

  void _dispatchId(int value) {
    dispatch<int>(value, key: ProfileKey.id);
  }

  void _dispatchUser(UserModel value) {
    dispatch<UserModel>(value, key: ProfileKey.user);
  }

  void _dispatchNotificationsIsEnable(bool value) {
    dispatch<bool>(value, key: ProfileKey.notificationIsEnable);
  }

  @override
  void onInit() async {
    await _loadUser();
    super.onInit();
  }

  Future<void> _loadUser() async {
    handleListing(
      action: () async {
        final result = await userRepository.getLoggedUser();
        result.map((user) {
          _dispatchId(user.id);
          _dispatchUser(user);
          _dispatchNotificationsIsEnable(user.notificationIsEnable);
        }).mapError(showError);
      },
    );
  }

  @override
  void handleEvent(ProfileEvent event) {
    if (event is DoLogout) {
      _doLogout();
    } else if (event is NavigateToUpdateName) {
      _navigateToUpdateName();
    } else if (event is NavigateToUpdateEmail) {
      _navigateToUpdateEmail();
    } else if (event is NavigateToUpdatePassword) {
      _navigateToUpdatePassword();
    } else if (event is UpdateReceivingNotification) {
      _updateReceivingNotication(event.isEnable);
    }
  }

  void _doLogout() async {
    await sessionRepository.clear();
    popAndToNamed(LoginBloC.route);
  }

  void _navigateToUpdateName() async {
    final saved = await toNamed(
      UpdateNameBloC.route,
      arguments: _user,
    );

    if (saved == true) {
      _loadUser();
    }
  }

  void _navigateToUpdateEmail() async {
    final saved = await toNamed(
      UpdateEmailBloC.route,
      arguments: _user,
    );

    if (saved == true) {
      _loadUser();
    }
  }

  void _navigateToUpdatePassword() async {
    toNamed(
      UpdatePasswordBloC.route,
      arguments: _id,
    );
  }

  void _updateReceivingNotication(bool isEnable) async {
    showLoadingDialog(
      action: userRepository.updateReceivingNotitication(_id, isEnable),
      onComplete: (result) {
        result.map((_) {
          _handleUpdateReceivingNotificationSuccess(isEnable);
        }).mapError(showError);
      },
    );
  }

  void _handleUpdateReceivingNotificationSuccess(bool isEnable) {
    final status = isEnable ? 'habilitadas' : 'desabilitadas';
    _dispatchNotificationsIsEnable(isEnable);
    showSuccess('Notificações $status');
  }
}
