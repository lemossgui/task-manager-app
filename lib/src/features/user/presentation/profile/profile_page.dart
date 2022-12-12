import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class ProfilePage extends ScreenView<ProfileBloC> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return MyAppBar(
      title: 'Perfil',
      actions: [
        MyTextButton(
          onPressed: () {
            bloc.dispatchEvent(DoLogout());
          },
          label: 'Sair',
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: bloc.streamOf<UserModel>(key: ProfileKey.user),
      builder: (_, snapshot) {
        final user = snapshot.data;
        if (!snapshot.hasData) {
          return const LoadingWidget(
            message: 'Buscando informações do seu usuário',
          );
        } else {
          return SingleChildScrollView(
            padding: getBasePadding(context),
            child: SeparatedColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              separator: const SizedBox(height: 16.0),
              children: [
                _buildUserData(user),
                _buildSecurity(),
                _buildPreferences(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildCard({
    required String title,
    required Widget content,
    EdgeInsetsGeometry? padding,
  }) {
    return MyCard(
      contentPadding: EdgeInsets.zero,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: secondaryColorLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Text(
              title,
              style: subtitle.semiBold.copyWith(color: secondaryTextColor),
            ),
          ),
          Padding(
            padding: padding ?? const EdgeInsets.all(16.0),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _buildUserData(UserModel? user) {
    return _buildCard(
      title: 'Informações do Usuário',
      content: SeparatedColumn(
        separator: const SizedBox(height: 4.0),
        children: [
          _buildName(user?.name),
          _buildEmail(user?.email),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
    );
  }

  Widget _buildName(String? name) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome Completo',
                style: smallText.bold,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  name ?? '',
                  style: text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        MyTextButton(
          onPressed: () {
            bloc.dispatchEvent(NavigateToUpdateName());
          },
          label: 'Alterar',
          backgroundColor: backgroundColorDark,
          textColor: primaryTextColor,
        ),
      ],
    );
  }

  Widget _buildEmail(String? email) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'E-mail',
                style: smallText.bold,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  email ?? '',
                  style: text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        MyTextButton(
          onPressed: () {
            bloc.dispatchEvent(NavigateToUpdateEmail());
          },
          label: 'Alterar',
          backgroundColor: backgroundColorDark,
          textColor: primaryTextColor,
        ),
      ],
    );
  }

  Widget _buildSecurity() {
    return _buildCard(
      title: 'Segurança',
      content: SeparatedColumn(
        children: [
          _buildChangePassword(),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
    );
  }

  Widget _buildChangePassword() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Senha',
            style: text,
          ),
        ),
        MyTextButton(
          onPressed: () {
            bloc.dispatchEvent(NavigateToUpdatePassword());
          },
          label: 'Alterar',
          backgroundColor: backgroundColorDark,
          textColor: primaryTextColor,
        ),
      ],
    );
  }

  Widget _buildPreferences() {
    return _buildCard(
      title: 'Preferências',
      content: SeparatedColumn(
        separator: const SizedBox(height: 16.0),
        children: [
          _buildDarkMode(),
          _buildReceiveNotifications(),
        ],
      ),
    );
  }

  Widget _buildDarkMode() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Modo Escuro',
            style: text,
          ),
        ),
        MySwitch(
          stream: bloc.streamOf<bool>(
            key: ProfileKey.darkMode,
          ),
          onChange: (value) {
            bloc.dispatch<bool?>(
              value,
              key: ProfileKey.darkMode,
            );
          },
          activeIcon: Icons.nightlight_round_rounded,
          inactiveIcon: Icons.wb_sunny_rounded,
        ),
      ],
    );
  }

  Widget _buildReceiveNotifications() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Receber Notificações',
            style: text,
          ),
        ),
        MySwitch(
          stream: bloc.streamOf<bool>(
            key: ProfileKey.notificationIsEnable,
          ),
          onChange: (value) {
            bloc.dispatchEvent(
              UpdateReceivingNotification(isEnable: value),
            );
          },
          activeIcon: Icons.notifications_active_rounded,
          inactiveIcon: Icons.notifications_off_rounded,
        ),
      ],
    );
  }
}
