import 'package:flutter/material.dart';
import 'package:project_l/utils/Styles/project-styles.dart';
import 'package:project_l/utils/project-form-button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItemInfo extends StatefulWidget {
  FormGroup form;
  Function editItem;

  ItemInfo({
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
                children: [
                  const Text(
                    'Editar',
                    style: TextStyle(fontSize: 18),
                  ),
                  const ProjectFormField(
                    formControlName: 'title',
                    label: 'Principal',
                    obscureText: false,
                    shape: 40,
                  ),
                  const ProjectFormField(
                    formControlName: 'content',
                    label: 'Conteúdo',
                    obscureText: false,
                    shape: 40,
                  ),
                  TextButton(
                    onPressed: () async {
                      widget.editItem(widget.form, context);
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
