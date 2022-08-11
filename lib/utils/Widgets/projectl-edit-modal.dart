import 'package:flutter/material.dart';
import 'package:project_l/utils/Styles/project-styles.dart';
import 'package:project_l/utils/Widgets/projectl-form-button.dart';
import 'package:project_l/utils/project-form-button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../Strings/project-strings.dart';

class ItemInfo extends StatefulWidget {
  final FormGroup form;
  final Function editItem;

  const ItemInfo({
    Key? key,
    required this.form,
    required this.editItem,
  }) : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ReactiveForm(
        formGroup: widget.form,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white
            ),
            color: ProjectLStyles.scaffoldColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Container(
                        color: Colors.red,
                        child: InkWell(
                            child: const Icon(
                              Icons.clear_outlined,
                              color: Colors.white,
                            ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  ProjectLStrings.edit,
                  style: ProjectLStyles.modalTitleStyles
                ),
                const ProjectFormField(
                  formControlName: 'title',
                  label: ProjectLStrings.main,
                  labelColor: Colors.white,
                  obscureText: false,
                  shape: 40,
                ),
                const ProjectFormField(
                  formControlName: 'content',
                  label: ProjectLStrings.description,
                  labelColor: Colors.white,
                  obscureText: false,
                  shape: 40,
                ),
                ProjectLButton(onTap: widget.editItem,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
