import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class StreamTextFieldLocalSearch<T extends Searchable> extends StatelessWidget {
  final Stream<T?> streamSelected;
  final bool requiredField;
  final bool enable;
  final String? hintText;
  final Stream<List<T>> streamItems;
  final Function(T?) onSelected;
  final bool closeKeyboardAfterSelect;

  const StreamTextFieldLocalSearch({
    Key? key,
    required this.streamSelected,
    required this.requiredField,
    required this.streamItems,
    required this.onSelected,
    this.enable = true,
    this.closeKeyboardAfterSelect = true,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<List<T>>(
          stream: streamItems,
          builder: (context, snapshot) {
            final list = snapshot.data ?? List.empty();
            return Expanded(
              child: Autocomplete<T>(
                onSelected: (value) {
                  onSelected(value);
                  if (closeKeyboardAfterSelect) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                optionsViewBuilder: (context, onAutoCompleteSelect, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      color: backgroundColorLight,
                      elevation: 8.0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = options.elementAt(index);
                            return GestureDetector(
                              onTap: () => onAutoCompleteSelect(item),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  item.searchable,
                                  style: text.copyWith(
                                    color: primaryTextColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
                displayStringForOption: (item) => item.searchable,
                fieldViewBuilder:
                    (_, controller, focusNode, onEditingComplete) {
                  return StreamBuilder<T?>(
                    stream: streamSelected,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        controller.text = snapshot.data!.searchable;
                        controller.selection = TextSelection.collapsed(
                          offset: controller.text.length,
                        );
                      } else {
                        controller.text = '';
                        controller.value = TextEditingValue.empty;
                      }
                      return TextField(
                        enabled: enable,
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        style: text.copyWith(
                          color: enable ? primaryTextColor : disableColor,
                        ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: hintText,
                          labelStyle: text.copyWith(
                            color: enable ? primaryTextColor : disableColor,
                          ),
                          hintStyle: text.copyWith(
                            color: enable ? primaryTextColor : disableColor,
                          ),
                          errorText: snapshot.error?.toString(),
                          errorStyle: smallText.copyWith(
                            color: errorColor,
                          ),
                          counter: const Offstage(),
                        ),
                      );
                    },
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    onSelected(null);
                    return const Iterable.empty();
                  } else {
                    return list
                        .where((element) => element
                            .searchable.stripAccentsAndUpperCase
                            .contains(
                                textEditingValue.text.stripAccentsAndUpperCase))
                        .toList();
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
