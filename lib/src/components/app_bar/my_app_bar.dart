import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  const MyAppBar({
    Key? key,
    required this.title,
    required this.actions,
    this.bottom,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight +
      (bottom?.preferredSize.height ?? 0.0) +
      (bottom != null ? 8.0 : 0.0));
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(widget.title),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: Row(
            children: widget.actions,
          ),
        ),
      ],
    );
  }
}
