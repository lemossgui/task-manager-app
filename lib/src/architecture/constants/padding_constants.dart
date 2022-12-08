import 'package:flutter/material.dart';

EdgeInsets getListBasePadding(BuildContext context, {double? value}) =>
    EdgeInsets.only(
      left: value ?? 8.0,
      right: value ?? 8.0,
      top: value ?? 8.0,
      bottom: MediaQuery.of(context).padding.bottom,
    );

EdgeInsets getFormBasePadding(BuildContext context, {double? value}) =>
    EdgeInsets.only(
      left: value ?? 16.0,
      right: value ?? 16.0,
      top: value ?? 16.0,
      bottom: MediaQuery.of(context).padding.bottom,
    );
