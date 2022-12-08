import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class Screen<T> extends GetPage<T> {
  Screen({
    required String name,
    required Widget Function() page,
    Injector? injector,
  }) : super(
          name: name,
          page: page,
          binding: injector,
        );
}
