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
