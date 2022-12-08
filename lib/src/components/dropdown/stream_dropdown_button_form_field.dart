import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class StreamDropdownButtonFormField<T extends Searchable>
    extends StatelessWidget {
  final Stream<T?> streamSelected;
  final bool requiredField;
  final bool enable;
  final String? hintText;
  final Stream<List<T>> streamItems;
  final Function(T?) onSelected;
  final bool closeKeyboardAfterSelect;

  const StreamDropdownButtonFormField({
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
    return StreamBuilder<List<T>>(
      stream: streamItems,
      builder: (_, snapshotList) {
        final list = snapshotList.data ?? List.empty();
        return StreamBuilder<T?>(
          stream: streamSelected,
          builder: (_, snapshot) {
            final selectedItem = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<T?>(
                  items: _buildItems(list),
                  value: selectedItem,
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
                  onChanged: (value) => onChanged(value, context),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void onChanged(T? value, context) {
    if (enable) {
      // if (closeKeyboardAfterSelect) {
      //   FocusScope.of(context).requestFocus(FocusNode());
      // }
      onSelected(value);
      return;
    }
    null;
  }

  List<DropdownMenuItem<T>> _buildItems(List<T> items) {
    return items.map(_buildItem).toList();
  }

  DropdownMenuItem<T> _buildItem(T item) {
    return DropdownMenuItem<T>(
      child: Text(
        item.searchable,
        style: text.copyWith(
          color: enable ? primaryTextColor : disableColor,
        ),
      ),
      value: item,
    );
  }
}
