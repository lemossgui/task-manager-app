import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends ScreenView<HomeBloC> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
