import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class UserFormPage extends ScreenView<UserFormBloC> {
  const UserFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
      child: StreamPasswordField(
        textStream: bloc.streamOf<String?>(
          key: UserFormKey.password,
        ),
        onTextChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UserFormKey.password,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: UserFormKey.passwordVisibility,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: UserFormKey.passwordVisibility,
        ),
        hintText: 'Senha',
      ),
    );
  }

  Widget _buildPasswordConfirmation() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamPasswordField(
        textStream: bloc.streamOf<String?>(
          key: UserFormKey.passwordConfirmation,
        ),
        onTextChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UserFormKey.passwordConfirmation,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: UserFormKey.passwordConfirmationVisibility,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: UserFormKey.passwordConfirmationVisibility,
        ),
        hintText: 'Confirmação de Senha',
      ),
    );
  }
}
