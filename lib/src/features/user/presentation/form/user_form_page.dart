import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class UserFormPage extends ScreenView<UserFormBloC> {
  const UserFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: MyTextButton(
              onPressed: () => bloc.dispatchEvent(SaveUser()),
              label: 'Salvar',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: getBasePadding(context),
        child: Column(
          children: [
            _buildName(),
            _buildEmail(),
            _buildPassword(),
            _buildPasswordConfirmation(),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: UserFormKey.name,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: UserFormKey.name,
      ),
      hintText: 'Nome Completo',
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamTextField(
        stream: bloc.streamOf<String?>(
          key: UserFormKey.email,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UserFormKey.email,
        ),
        hintText: 'E-mail',
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamTextField(
        stream: bloc.streamOf<String?>(
          key: UserFormKey.password,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UserFormKey.password,
        ),
        hintText: 'Senha',
        obscureText: true,
      ),
    );
  }

  Widget _buildPasswordConfirmation() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamTextField(
        stream: bloc.streamOf<String?>(
          key: UserFormKey.passwordConfirmation,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UserFormKey.passwordConfirmation,
        ),
        hintText: 'Confirmação de Senha',
        obscureText: true,
      ),
    );
  }
}
