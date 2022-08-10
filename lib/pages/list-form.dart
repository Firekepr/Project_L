import 'package:flutter/material.dart';
import 'package:project_l/interface/List-interface.dart';
import 'package:project_l/utils/Styles/project-styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../utils/project-form-button.dart';

class ListBlock extends StatelessWidget {
  final ListInterface item;
  final Function updateCheckBox;
  final Function viewInformation;
  final Function deleteItem;

  const ListBlock({
    Key? key,
    required this.item,
    required this.updateCheckBox,
    required this.viewInformation,
    required this.deleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
      ),
      child: Card(
        elevation: 0,
        color: ProjectStyles.listTileColor,
        child: Row(
          children: <Widget>[
            Checkbox(
                shape: const CircleBorder(),
                value: item.checkBox,
                activeColor: ProjectStyles.checkBoxColor,
                hoverColor: Colors.deepPurple,
                onChanged: (value) async {
                  updateCheckBox(value);
                }),
            Expanded(
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: ProjectStyles.checkedItem(item.checkBox)),
                    item.content!.isNotEmpty
                        ? Text(
                            item.content!,
                            style: ProjectStyles.checkedItem(item.checkBox),
                          )
                        : Container(),
                  ],
                ),
                onTap: () {
                  viewInformation();
                },
              ),
            ),
            Column(
              children: [
                item.checkBox
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                          onTap: () {
                            deleteItem();
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAddPopUp(
    BuildContext context,
    TextEditingController controller,
    FormGroup form,
  ) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReactiveForm(
              formGroup: form,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Adicionando um novo item',
                      style: TextStyle(fontSize: 18),
                    ),
                    const ProjectFormField(
                      formControlName: 'title',
                      label: 'Título',
                      obscureText: false,
                    ),
                    const ProjectFormField(
                      formControlName: 'content',
                      label: 'Conteúdo',
                      obscureText: false,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Salvar'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
