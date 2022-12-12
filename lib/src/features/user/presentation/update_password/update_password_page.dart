import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class UpdatePasswordPage extends ScreenView<UpdatePasswordBloC> {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Senha'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              child: MyTextButton(
                onPressed: () => bloc.dispatchEvent(UpdatePassword()),
                label: 'Salvar',
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: getBasePadding(context),
          child: Column(
            children: [
              _buildOldPassword(),
              _buildNewPassword(),
              _buildNewPasswordConfirmation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOldPassword() {
    return StreamPasswordField(
      textStream: bloc.streamOf<String?>(
        key: UpdatePasswordKey.oldPassword,
      ),
      onTextChanged: (value) => bloc.dispatch<String?>(
        value,
        key: UpdatePasswordKey.oldPassword,
      ),
      visibilityStream: bloc.streamOf<bool?>(
        key: UpdatePasswordKey.oldPasswordVisibility,
      ),
      onVisibilityChanged: (value) => bloc.dispatch<bool?>(
        value,
        key: UpdatePasswordKey.oldPasswordVisibility,
      ),
      hintText: 'Senha Antiga',
    );
  }

  Widget _buildNewPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamPasswordField(
        textStream: bloc.streamOf<String?>(
          key: UpdatePasswordKey.newPassword,
        ),
        onTextChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UpdatePasswordKey.newPassword,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: UpdatePasswordKey.newPasswordVisibility,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: UpdatePasswordKey.newPasswordVisibility,
        ),
        hintText: 'Nova Senha',
      ),
    );
  }

  Widget _buildNewPasswordConfirmation() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamPasswordField(
        textStream: bloc.streamOf<String?>(
          key: UpdatePasswordKey.newPasswordConfirmation,
        ),
        onTextChanged: (value) => bloc.dispatch<String?>(
          value,
          key: UpdatePasswordKey.newPasswordConfirmation,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: UpdatePasswordKey.newPasswordConfirmationVisibility,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: UpdatePasswordKey.newPasswordConfirmationVisibility,
        ),
        hintText: 'Confirmação de Senha',
      ),
    );
  }
}
