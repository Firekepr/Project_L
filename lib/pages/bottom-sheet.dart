import 'package:flutter/material.dart';

class ListBottomSheet extends StatefulWidget {
  final Function addItem;
  final TextEditingController controller;

  const ListBottomSheet({
    Key? key,
    required this.controller,
    required this.addItem,
  }) : super(key: key);

  @override
  State<ListBottomSheet> createState() => _ListBottomSheetState();
}

class _ListBottomSheetState extends State<ListBottomSheet> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[800],
      autofocus: false,
      trailing: IconButton(
        onPressed: () {
          widget.addItem();
        },
        icon: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black38,
          // boxShadow: const [
          //   BoxShadow(color: Colors.green, spreadRadius: 3),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            expands: false,
            maxLines: 5,
            minLines: 1,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              fillColor: Colors.grey,
              // filled: true,
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              hintText: 'Eu quero...',
            ),
            controller: widget.controller,
          ),
        ),
      ),
    );
  }
}
