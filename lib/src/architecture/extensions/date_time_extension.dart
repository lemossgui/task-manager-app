import 'package:intl/intl.dart';

extension DateTimeNullableExtension on DateTime? {
  String? toDisplay() {
    if (this != null) {
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(this!);
    }
    return null;
  }
}

extension DateTimeExtension on DateTime {
  String toDisplay() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
