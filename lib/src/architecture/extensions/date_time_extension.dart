import 'package:intl/intl.dart';

extension DateTimeNullableExtension on DateTime? {
  String? toDisplay() {
    final value = this;
    if (value != null) {
      return value.toDisplay();
    }
    return null;
  }

  String? toDisplayDate() {
    final value = this;
    if (value != null) {
      return value.toDisplayDate();
    }
    return null;
  }

  String? toDisplayTime() {
    final value = this;
    if (value != null) {
      return value.toDisplayTime();
    }
    return null;
  }
}

extension DateTimeExtension on DateTime {
  String toDisplay() {
    final formatter = DateFormat("dd/MM 'às' hh:mm");
    return formatter.format(this);
  }

  String toDisplayDate() {
    final formatter = DateFormat('dd/MM');
    return formatter.format(this);
  }

  String toDisplayTime() {
    final formatter = DateFormat('hh:mm');
    return formatter.format(this);
  }
}
