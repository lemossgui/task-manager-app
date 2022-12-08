import 'dart:developer';
import 'package:get/get.dart';

abstract class BaseConnector extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://localhost:8080';
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 30);

    httpClient.addRequestModifier<void>((request) async {
      log('[${request.method}] => [${request.url}]');
      return request;
    });

    super.onInit();
  }
}
