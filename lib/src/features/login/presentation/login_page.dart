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
      image: Svg('assets/images/task_list.svg'),
    );
  }

  Widget _buildEmailField() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: LoginKey.email,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: LoginKey.email,
      ),
      hintText: 'E-mail',
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return StreamBuilder<bool>(
        stream: null,
        builder: (context, snapshot) {
          return StreamTextField(
            stream: bloc.streamOf<String?>(
              key: LoginKey.password,
            ),
            onChanged: (value) => bloc.dispatch<String?>(
              value,
              key: LoginKey.password,
            ),
            hintText: 'Senha',
            obscureText: true,
          );
        });
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
        ),
        onPressed: () => bloc.dispatchEvent(NavigateToRegister()),
        child: Container(
          height: 48.0,
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'Cadastro',
            style: subtitle,
          ),
        ),
      ),
    );
  }
}
