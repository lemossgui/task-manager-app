import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final Function onTap;
  final Widget content;

  const ListCard({
    Key? key,
    required this.onTap,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    );
    return Card(
      shape: shape,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        onTap: () => onTap(),
        shape: shape,
        title: content,
      ),
    );
  }
}
