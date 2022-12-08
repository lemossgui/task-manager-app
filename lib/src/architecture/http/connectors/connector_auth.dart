import 'package:task_manager/task_manager.dart';
import 'package:get/get.dart';
import 'dart:developer';

class ConnectorAuth extends BaseConnector {
  @override
  void onInit() async {
    super.onInit();

    final sessionRepository = Get.find<SessionRepository>();
    final session = await sessionRepository.get();
    final token = session?.token;

    if (token != null) {
      var headers = {'Authorization': "Bearer $token"};

      // log(token);

      httpClient.addRequestModifier<void>((request) async {
        request.headers.addAll(headers);
        log('[${request.method}] => [${request.url}]');
        return request;
      });
    }
  }
}
