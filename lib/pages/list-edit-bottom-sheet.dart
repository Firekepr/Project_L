import 'package:flutter/material.dart';
import 'package:project_l/utils/Styles/project-styles.dart';
import 'package:project_l/utils/project-form-button.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    return Scaffold(
      backgroundColor: ProjectStyles.listTileColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReactiveForm(
          formGroup: widget.form,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white
              ),
              color: ProjectStyles.scaffoldColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                  const Text(
                    'Editar',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                    ),
                  ),
                  const ProjectFormField(
                    formControlName: 'title',
                    label: 'Principal',
                    labelColor: Colors.white,
                    obscureText: false,
                    shape: 40,
                  ),
                  const ProjectFormField(
                    formControlName: 'content',
                    label: 'Conteúdo',
                    labelColor: Colors.white,
                    obscureText: false,
                    shape: 40,
                  ),
                  TextButton(
                    onPressed: () async {
                      widget.editItem();
                    },
                    child: const Text('Salvar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
