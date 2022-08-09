import 'package:flutter/material.dart';

class ListAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Function deleteAll;

  const ListAppBar({
    Key? key,
    required this.deleteAll,
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
      leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            widget.deleteAll();
          }),
      title: const Text('Project_L'),
    );
  }
}
