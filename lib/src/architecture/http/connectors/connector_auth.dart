import 'package:task_manager/task_manager.dart';
import 'package:get/get.dart';
import 'dart:developer';

class ConnectorAuth extends BaseConnector {
  @override
  void onInit() async {
    httpClient.addRequestModifier<void>((request) async {
      final sessionRepository = Get.find<SessionRepository>();
      final result = await sessionRepository.get();

      result.map((session) {
        var headers = {'Authorization': "Bearer ${session.token}"};
        request.headers.addAll(headers);
        log('[${request.method}] => [${request.url}]');
        return request;
      });

      return request;
    });

    super.onInit();
  }
}
