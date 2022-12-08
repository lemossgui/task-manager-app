import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class RootPage extends ScreenView<RootBloC> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<String?>(
            stream: bloc.streamOf<String?>(),
            builder: (_, snapshot) {
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
