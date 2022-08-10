import 'package:flutter/material.dart';

class ListAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ListAppBar({
    Key? key,
    required this.preferredSize,
  }) : super(key: key);

  @override
  State<ListAppBar> createState() => _ListAppBarState();
}

class _ListAppBarState extends State<ListAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[800],
      title: const Center(
          child: Text('Project_L'),
      ),
    );
  }
}
