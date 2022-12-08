import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: defaultTheme,
      getPages: routes,
      initialBinding: MainInjector(),
      debugShowCheckedModeBanner: false,
    );
  }
}
