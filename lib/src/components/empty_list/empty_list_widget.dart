import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final String message;

  const EmptyListWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Image(
            height: 200.0,
            width: 200.0,
            image: Svg('assets/images/empty.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              message,
              style: text,
            ),
          ),
        ],
      ),
    );
  }
}
