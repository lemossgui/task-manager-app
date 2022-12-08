import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

abstract class ScreenView<T> extends StatelessWidget {
  final String? tag = null;

  const ScreenView({Key? key}) : super(key: key);

  T get bloc => InjectorImpl().find<T>(tag: tag);

  @override
  Widget build(BuildContext context);
}
