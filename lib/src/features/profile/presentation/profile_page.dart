import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class ProfilePage extends ScreenView<ProfileBloC> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: MyTextButton(
              onPressed: () {
                bloc.dispatchEvent(DoLogout());
              },
              label: 'Sair',
            ),
          ),
        ],
      ),
    );
  }
}
