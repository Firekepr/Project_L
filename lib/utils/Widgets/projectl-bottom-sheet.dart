import 'package:flutter/material.dart';
import 'package:project_l/utils/Strings/project-strings.dart';

class ProjectLBottomSheet extends StatefulWidget {
  final Function addItem;
  final TextEditingController controller;

  const ProjectLBottomSheet({
    Key? key,
    required this.controller,
    required this.addItem,
  }) : super(key: key);

  @override
  State<ProjectLBottomSheet> createState() => _ProjectLBottomSheetState();
}

class _ProjectLBottomSheetState extends State<ProjectLBottomSheet> {
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
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            expands: false,
            maxLines: 5,
            minLines: 1,
            style: const TextStyle(color: Colors.white),
            decoration:  const InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              hintText: ProjectLStrings.wish,
            ),
            controller: widget.controller,
          ),
        ),
      ),
    );
  }
}
