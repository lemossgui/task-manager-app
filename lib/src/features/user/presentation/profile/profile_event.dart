abstract class ProfileEvent {}

class DoLogout extends ProfileEvent {}

class NavigateToUpdateName extends ProfileEvent {}

class NavigateToUpdateEmail extends ProfileEvent {}

class NavigateToUpdatePassword extends ProfileEvent {}

class UpdateReceivingNotification extends ProfileEvent {
  final bool isEnable;

  UpdateReceivingNotification({
    required this.isEnable,
  });
}
