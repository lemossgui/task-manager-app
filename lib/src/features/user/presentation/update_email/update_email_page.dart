import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class UpdateEmailPage extends ScreenView<UpdateEmailBloC> {
  const UpdateEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E-mail'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              child: MyTextButton(
                onPressed: () => bloc.dispatchEvent(UpdateEmail()),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: UpdateEmailKey.email,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: UpdateEmailKey.email,
      ),
      hintText: 'E-mail',
    );
  }
}
