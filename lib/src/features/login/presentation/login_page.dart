import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class LoginPage extends ScreenView<LoginBloC> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          padding: getBasePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildImage(),
              _buildEmailField(),
              _buildPasswordField(),
              _buildAccessButton(),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return const Image(
      height: 200.0,
      width: 200.0,
      image: Svg('assets/images/login.svg'),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: StreamTextField(
        stream: bloc.streamOf<String?>(
          key: LoginKey.email,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: LoginKey.email,
        ),
        hintText: 'E-mail',
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: StreamPasswordField(
        textStream: bloc.streamOf<String?>(
          key: LoginKey.password,
        ),
        onTextChanged: (value) => bloc.dispatch<String?>(
          value,
          key: LoginKey.password,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: LoginKey.isPasswordVisible,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: LoginKey.isPasswordVisible,
        ),
        hintText: 'Senha',
      ),
    );
  }

  Widget _buildAccessButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: ElevatedPersistentButton(
        bloc: bloc,
        text: 'Acessar',
        color: primaryColor,
        onPressed: () => bloc.dispatchEvent(DoLogin()),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            secondaryColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        onPressed: () => bloc.dispatchEvent(NavigateToUserForm()),
        child: Container(
          height: 48.0,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            'Cadastro',
            style: subtitle.copyWith(
              color: secondaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
