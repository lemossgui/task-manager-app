import 'package:flutter_svg_provider/flutter_svg_provider.dart';
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
          padding: getFormBasePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Image(
                height: 200.0,
                width: 200.0,
                image: Svg('assets/images/to_do_list.svg'),
              ),
              StreamTextField(
                stream: bloc.streamOf<String?>(
                  key: LoginField.identifier,
                ),
                onChanged: (value) => bloc.dispatch<String?>(
                  value,
                  key: LoginField.identifier,
                ),
                hintText: 'Usuário ou e-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              StreamTextField(
                stream: bloc.streamOf<String?>(
                  key: LoginField.password,
                ),
                onChanged: (value) => bloc.dispatch<String?>(
                  value,
                  key: LoginField.password,
                ),
                hintText: 'Senha',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedPersistentButton(
                  bloc: bloc,
                  text: 'Acessar',
                  color: primaryColor,
                  onPressed: () => bloc.dispatchEvent(DoLogin()),
                ),
              ),
              Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
