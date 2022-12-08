import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class SelectColorPage extends ScreenView<SelectColorBloC> {
  const SelectColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de Cor'),
      ),
      body: SingleChildScrollView(
        padding: getListBasePadding(context),
        child: StreamBuilder<String?>(
            stream: bloc.streamOf<String?>(
              key: SelectColorKey.selected,
            ),
            builder: (_, snapshot) {
              final selectedColor = snapshot.data;
              return StreamBuilder<List<ColorItem>>(
                  stream: bloc.streamOf<List<ColorItem>>(
                    key: SelectColorKey.list,
                  ),
                  builder: (_, snapshot) {
                    final list = snapshot.data ?? List.empty();
                    return Column(
                      children: list.map((item) {
                        return ListCard(
                          onTap: () {
                            bloc.dispatchEvent(
                              SelectColor(key: item.key),
                            );
                          },
                          content: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: getColorValueByKey(item.key),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 40.0,
                                  width: 8.0,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  getColorDescriptionByKey(item.key),
                                  style: subtitle.bold,
                                ),
                              ),
                              Visibility(
                                visible: selectedColor == item.key,
                                child: const Icon(Icons.check_box_rounded),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  });
            }),
      ),
    );
  }
}
