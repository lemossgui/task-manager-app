import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class UpdateNamePage extends ScreenView<UpdateNameBloC> {
  const UpdateNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nome'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: MyTextButton(
              onPressed: () => bloc.dispatchEvent(UpdateName()),
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
    );
  }

  Widget _buildName() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: UpdateNameKey.name,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: UpdateNameKey.name,
      ),
      hintText: 'Nome Completo',
    );
  }
}
