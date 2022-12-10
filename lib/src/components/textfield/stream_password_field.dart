import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class StreamPasswordField extends StatefulWidget {
  final Stream<String?> textStream;
  final Function(String?) onTextChanged;
  final Stream<bool?> visibilityStream;
  final Function(bool?) onVisibilityChanged;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLength;

  const StreamPasswordField({
    super.key,
    required this.textStream,
    required this.onTextChanged,
    required this.visibilityStream,
    required this.onVisibilityChanged,
    required this.hintText,
    this.keyboardType,
    this.maxLength,
  });

  @override
  State<StreamPasswordField> createState() => _StreamPasswordFieldState();
}

class _StreamPasswordFieldState extends State<StreamPasswordField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: widget.textStream,
      builder: (context, snapshotText) {
        if (snapshotText.hasData) {
          controller.text = snapshotText.data!;
          controller.selection = TextSelection.collapsed(
            offset: controller.text.length,
          );
        } else {
          controller.text = '';
          controller.value = TextEditingValue.empty;
        }
        return StreamBuilder<bool?>(
          stream: widget.visibilityStream,
          builder: (_, snapshot) {
            final isVisible = snapshot.data ?? false;
            return TextFormField(
              controller: controller,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              maxLength: widget.maxLength,
              onChanged: widget.onTextChanged,
              obscureText: !isVisible,
              style: text.copyWith(
                color: primaryTextColor,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: widget.hintText,
                labelStyle: text.copyWith(
                  color: primaryTextColor,
                ),
                hintStyle: text.copyWith(
                  color: primaryTextColor,
                ),
                errorText: snapshotText.error?.toString(),
                errorStyle: smallText.copyWith(
                  color: errorColor,
                ),
                counter: const Offstage(),
                suffixIcon: IconButton(
                  onPressed: (() => widget.onVisibilityChanged(!isVisible)),
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
