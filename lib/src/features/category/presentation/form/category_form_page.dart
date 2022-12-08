import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class CategoryFormPage extends ScreenView<CategoryFormBloC> {
  const CategoryFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.streamOf<bool>(key: CategoryFormKey.isEditing),
      builder: (_, snapshot) {
        final isEditing = snapshot.data ?? false;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Categoria'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                child: MyTextButton(
                  onPressed: () => isEditing
                      ? bloc.dispatchEvent(UpdateCategory())
                      : bloc.dispatchEvent(SaveCategory()),
                  label: isEditing ? 'Salvar' : 'Cadastrar',
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: getFormBasePadding(context),
            child: Column(
              children: [
                StreamTextField(
                  stream: bloc.streamOf<String?>(
                    key: CategoryFormKey.description,
                  ),
                  onChanged: (value) => bloc.dispatch<String?>(
                    value,
                    key: CategoryFormKey.description,
                  ),
                  hintText: 'Descrição',
                ),
                _buildColor(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildColor() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamBuilder(
        stream: bloc.streamOf<String?>(
          key: CategoryFormKey.color,
        ),
        builder: (_, snapshot) {
          final hasError = snapshot.hasError;
          final hasColor = snapshot.hasData;
          final color = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: backgroundColorDark,
                  borderRadius: BorderRadius.circular(16.0),
                  border: hasError
                      ? Border.all(
                          color: errorColor,
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    hasColor
                        ? Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Container(
                              height: 40.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                color: getColorValueByKey(color),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
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
                            hasColor ? getColorDescriptionByKey(color) : '-',
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
                      backgroundColor: primaryColor,
                    )
                  ],
                ),
              ),
              Visibility(
                visible: hasError,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${snapshot.error?.toString()}',
                    style: smallText.copyWith(
                      color: errorColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
