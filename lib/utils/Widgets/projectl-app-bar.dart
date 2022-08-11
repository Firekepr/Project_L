import 'package:flutter/material.dart';
import 'package:project_l/utils/Styles/project-styles.dart';

class ProjectLAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ProjectLAppBar({
    Key? key,
    required this.preferredSize,
  }) : super(key: key);

  @override
  State<ProjectLAppBar> createState() => _ProjectLAppBarState();
}

class _ProjectLAppBarState extends State<ProjectLAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectLStyles.systemPrimaryColor,
      title: const Center(
          child: Text('Project_L'),
      ),
    );
  }
}
