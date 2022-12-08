import 'package:multiple_result/multiple_result.dart';

class Response<T> {
  final T? params;
  final String message;
  final String status;
  final int? totalPages;
  final int? totalItems;

  Response({
    this.params,
    required this.message,
    required this.status,
    this.totalPages,
    this.totalItems,
  });

  bool get isSuccess => status == 'success';

  Result<S, String> getResult<S>() {
    if (isSuccess) {
      return Success(params as S);
    }
    return Error(message);
  }

  Result<S, String> mapAndGetResult<S>(S Function(T? params) fromJson) {
    if (isSuccess) {
      return Success(fromJson(params));
    }
    return Error(message);
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response<T>(
      params: map['params'] as T,
      message: map['message'],
      status: map['status'],
      totalPages: map['totalPages'],
      totalItems: map['totalItems'],
    );
  }
}
