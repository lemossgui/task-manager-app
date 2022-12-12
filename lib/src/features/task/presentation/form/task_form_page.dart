import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_manager/task_manager.dart';

class TaskFormPage extends ScreenView<TaskFormBloC> {
  const TaskFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.streamOf<bool>(
        key: TaskFormKey.isEditing,
      ),
      builder: (_, snapshot) {
        final isEditing = snapshot.data ?? false;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tarefa'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: MyTextButton(
                    onPressed: () => isEditing
                        ? bloc.dispatchEvent(UpdateTask())
                        : bloc.dispatchEvent(SaveTask()),
                    label: 'Salvar',
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              padding: getBasePadding(context),
              child: Column(
                children: [
                  _buildCard(),
                  const Divider(),
                  SeparatedColumn(
                    separator: const SizedBox(height: 16.0),
                    children: [
                      _buildTitle(),
                      _buildDescription(),
                      _buildCategoryDropdown(),
                      _buildPriorityDropdown(),
                      _buildStartDate(),
                      _buildEndDate(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: TaskFormKey.title,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: TaskFormKey.title,
      ),
      hintText: 'Título',
    );
  }

  Widget _buildDescription() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: TaskFormKey.description,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: TaskFormKey.description,
      ),
      hintText: 'Descrição',
    );
  }

  Widget _buildStartDate() {
    return StreamBuilder<DateTime?>(
      stream: bloc.streamOf<DateTime?>(
        key: TaskFormKey.startDate,
      ),
      builder: (_, snapshot) {
        final date = snapshot.data;
        return MyCard(
          hasError: snapshot.hasError,
          content: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'Data e Hora Inicial',
                        style: smallText,
                      ),
                    ),
                    Text(
                      date != null ? date.toDisplay() : '-',
                      style: text.bold,
                    ),
                  ],
                ),
              ),
              MyTextButton(
                onPressed: () {
                  bloc.dispatchEvent(SelectStartDate());
                },
                label: snapshot.hasData ? 'Alterar' : 'Definir',
                backgroundColor: backgroundColorDark,
                textColor: primaryTextColor,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildEndDate() {
    return StreamBuilder<DateTime?>(
      stream: bloc.streamOf<DateTime?>(
        key: TaskFormKey.endDate,
      ),
      builder: (_, snapshot) {
        final date = snapshot.data;
        return MyCard(
          hasError: snapshot.hasError,
          content: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'Data e Hora Final',
                        style: smallText,
                      ),
                    ),
                    Text(
                      date != null ? date.toDisplay() : '-',
                      style: text.bold,
                    ),
                  ],
                ),
              ),
              MyTextButton(
                onPressed: () {
                  bloc.dispatchEvent(SelectEndDate());
                },
                label: snapshot.hasData ? 'Alterar' : 'Definir',
                backgroundColor: backgroundColorDark,
                textColor: primaryTextColor,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryDropdown() {
    return StreamDropdownButtonFormField<CategoryModel>(
      hintText: 'Categoria',
      streamItems: bloc.streamOf<List<CategoryModel>>(
        key: TaskFormKey.categories,
      ),
      streamSelected: bloc.streamOf<CategoryModel?>(
        key: TaskFormKey.category,
      ),
      onSelected: (value) {
        bloc.dispatch<CategoryModel?>(
          value,
          key: TaskFormKey.category,
        );
      },
      requiredField: true,
      buildItem: (item) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                height: 16.0,
                width: 8.0,
              ),
            ),
            Text(
              item.description,
              style: text.semiBold,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPriorityDropdown() {
    return StreamDropdownButtonFormField<PriorityModel>(
      hintText: 'Prioridade',
      streamItems: bloc.streamOf<List<PriorityModel>>(
        key: TaskFormKey.priorities,
      ),
      streamSelected: bloc.streamOf<PriorityModel?>(
        key: TaskFormKey.priority,
      ),
      onSelected: (value) {
        bloc.dispatch<PriorityModel?>(
          value,
          key: TaskFormKey.priority,
        );
      },
      requiredField: true,
      buildItem: (item) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(
                Icons.upgrade,
                color: item.color,
              ),
            ),
            Text(
              item.description,
              style: text.semiBold,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: MyCard(
        contentPadding: const EdgeInsets.all(16.0),
        content: SeparatedColumn(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTitleCard(),
                ),
                _buildCategoryCard(),
              ],
            ),
            _buildDescriptionCard(),
            const Divider(),
            Row(
              children: [
                _buildPriorityCard(),
                _buildDatesCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleCard() {
    return StreamBuilder<String?>(
      stream: bloc.streamOf<String?>(key: TaskFormKey.title),
      builder: (_, snapshot) {
        return Text(
          snapshot.data ?? 'Título',
          style: title.bold,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      },
    );
  }

  Widget _buildCategoryCard() {
    return StreamBuilder<CategoryModel?>(
      stream: bloc.streamOf<CategoryModel?>(
        key: TaskFormKey.category,
      ),
      builder: (context, snapshot) {
        final category = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
              color: (category?.color ?? secondaryColorLight).withOpacity(0.2),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              category?.description ?? 'Categoria',
              style: text.copyWith(
                color: category?.color ?? secondaryColorLight,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDescriptionCard() {
    return StreamBuilder<String?>(
      stream: bloc.streamOf<String?>(key: TaskFormKey.description),
      builder: (_, snapshot) {
        return Text(
          snapshot.data ?? 'Descrição',
          style: text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        );
      },
    );
  }

  Widget _buildPriorityCard() {
    return StreamBuilder<PriorityModel?>(
      stream: bloc.streamOf<PriorityModel?>(
        key: TaskFormKey.priority,
      ),
      builder: (context, snapshot) {
        final priority = snapshot.data;
        return Expanded(
          child: Row(
            children: [
              Icon(
                Icons.upgrade,
                color: priority?.color ?? secondaryColorLight,
              ),
              Text(
                priority?.description ?? 'Prioridade',
                style: text.semiBold.copyWith(color: secondaryColorLight),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDatesCard() {
    return SeparatedColumn(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        StreamBuilder<DateTime?>(
          stream: bloc.streamOf<DateTime?>(
            key: TaskFormKey.startDate,
          ),
          builder: (context, snapshot) {
            final date = snapshot.data;
            return RichText(
              text: TextSpan(
                text: 'Começa em ',
                style: smallText.copyWith(
                  color: secondaryColorLight,
                ),
                children: [
                  TextSpan(
                    text: date.toDisplayDate() ?? '-',
                    style: smallText.bold,
                  ),
                  const TextSpan(text: ' às '),
                  TextSpan(
                    text: date.toDisplayTime() ?? '-',
                    style: smallText.bold,
                  )
                ],
              ),
            );
          },
        ),
        StreamBuilder<DateTime?>(
          stream: bloc.streamOf<DateTime?>(
            key: TaskFormKey.endDate,
          ),
          builder: (context, snapshot) {
            final date = snapshot.data;
            return RichText(
              text: TextSpan(
                text: 'Termina em ',
                style: smallText.copyWith(
                  color: secondaryColorLight,
                ),
                children: [
                  TextSpan(
                    text: date.toDisplayDate() ?? '-',
                    style: smallText.bold,
                  ),
                  const TextSpan(text: ' às '),
                  TextSpan(
                    text: date.toDisplayTime() ?? '-',
                    style: smallText.bold,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
