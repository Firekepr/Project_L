import 'package:flutter/material.dart';
import 'package:project_l/database/list.database.dart';
import 'package:project_l/interface/List-interface.dart';

class ListBlock extends StatelessWidget {
  final ListInterface item;

  const ListBlock({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey[900],
      child: Row(
        children: <Widget>[
          Checkbox(
              shape: const CircleBorder(),
              value: item.checkBox,
              onChanged: (value) async {
                updateCheckBox(value);
              }),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: item.checkBox! ? Colors.white24 : Colors.red,
                  ),
                ),
                item.content!.isNotEmpty
                    ? Text(
                  item.content!,
                  style: TextStyle(
                    color: item.checkBox! ? Colors.white24 : Colors.red,
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  updateCheckBox(bool? value) async {
    await ListDataBase.instance.updateCheckBox(item, value!);

    // ListDataBase.instance.updateListItems();
  }
}