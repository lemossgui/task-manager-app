import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:task_manager/task_manager.dart';

class MySwitch extends StatelessWidget {
  final Stream<bool> stream;
  final Function(bool) onChange;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const MySwitch({
    super.key,
    required this.stream,
    required this.onChange,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool?>(
      stream: stream,
      builder: (_, snapshot) {
        final value = snapshot.data ?? false;
        return FlutterSwitch(
          height: 32.0,
          width: 64.0,
          toggleSize: 24.0,
          value: value,
          borderRadius: 48.0,
          padding: 2.0,
          activeToggleColor: backgroundColor,
          inactiveToggleColor: backgroundColor,
          activeSwitchBorder: Border.all(
            color: primaryColor,
            width: 2.0,
          ),
          inactiveSwitchBorder: Border.all(
            color: backgroundColorDark,
            width: 2.0,
          ),
          activeColor: primaryColor,
          inactiveColor: backgroundColorDark,
          activeIcon: Icon(
            activeIcon,
            color: secondaryColorLight,
          ),
          inactiveIcon: Icon(
            inactiveIcon,
            color: secondaryColorLight,
          ),
          onToggle: onChange,
        );
      },
    );
  }
}
