import 'package:flutter/material.dart';
import 'package:project_l/interface/List-interface.dart';
import 'package:project_l/utils/Styles/project-styles.dart';

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
        elevation: 3,
        color: ProjectLStyles.listTileColor,
        child: Row(
          children: <Widget>[
            Checkbox(
                shape: const CircleBorder(),
                value: item.checkBox,
                activeColor: ProjectLStyles.checkBoxColor,
                side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
                onChanged: (value) async {
                  updateCheckBox(value);
                }),
            Expanded(
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: ProjectLStyles.checkedItemTitle(item.checkBox),
                    ),
                    item.content!.isNotEmpty
                        ? Text(
                            item.content!,
                            style: ProjectLStyles.checkedItemContent(item.checkBox),
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
}
