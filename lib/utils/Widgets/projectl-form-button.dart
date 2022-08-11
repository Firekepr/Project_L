import 'package:flutter/material.dart';

import '../Strings/project-strings.dart';

class ProjectLButton extends StatelessWidget {
  final Function onTap;

  const ProjectLButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(40),
          color: Colors.grey[800],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            ProjectLStrings.save,
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
