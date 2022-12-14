import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class CategoryFormPage extends ScreenView<CategoryFormBloC> {
  const CategoryFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildForm(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Categoria'),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: StreamBuilder<bool>(
            stream: bloc.streamOf<bool>(key: CategoryFormKey.isEditing),
            builder: (_, snapshot) {
              final isEditing = snapshot.data ?? false;
              return MyTextButton(
                onPressed: () => isEditing
                    ? bloc.dispatchEvent(UpdateCategory())
                    : bloc.dispatchEvent(SaveCategory()),
                label: 'Salvar',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      padding: getBasePadding(context),
      child: Column(
        children: [
          _buildDescription(),
          _buildColor(),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: CategoryFormKey.description,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: CategoryFormKey.description,
      ),
      hintText: 'Descrição',
    );
  }

  Widget _buildColor() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamBuilder(
        stream: bloc.streamOf<String?>(
          key: CategoryFormKey.colorKey,
        ),
        builder: (_, snapshot) {
          final hasError = snapshot.hasError;
          final hasColor = snapshot.hasData;
          final colorKey = snapshot.data;
          return MyCard(
            hasError: hasError,
            content: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Cor',
                          style: smallText,
                        ),
                      ),
                      Text(
                        hasColor ? getCategoryColorDescription(colorKey) : '-',
                        style: text.bold,
                      ),
                    ],
                  ),
                ),
                MyTextButton(
                  onPressed: () {
                    bloc.dispatchEvent(
                      NavigateToSelectColor(),
                    );
                  },
                  label: hasColor ? 'Alterar' : 'Definir',
                  backgroundColor: backgroundColorDark,
                  textColor: primaryTextColor,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
