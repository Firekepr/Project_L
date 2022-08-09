import 'package:flutter/material.dart';
import 'package:project_l/database/list.database.dart';
import 'package:project_l/interface/List-interface.dart';
import 'package:project_l/pages/list-app-bar.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'bottom-sheet.dart';
import 'list-form.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final textController = TextEditingController();

  final FormGroup _form = FormGroup({
    'id': FormControl<int>(),
    'title': FormControl<String>(),
    'content': FormControl<String>(),
    'checkbox': FormControl<String>(),
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ListAppBar(
        deleteAll: deleteAll,
        preferredSize: const Size.fromHeight(60),
      ),
      body: FutureBuilder<List<ListInterface>>(
          future: ListDataBase.instance.getListValues(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ListInterface>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Loading...'),
              );
            }
            return snapshot.data!.isNotEmpty
                ? ListView(
                    children: snapshot.data!.map((list) {
                      return ListBlock(
                        item: list,
                      );
                    }).toList(),
                  )
                : Container();
          }),
      bottomSheet: ListBottomSheet(
        controller: textController,
        addItem: addTitleToList,
      ),
    );
  }

  Future<void> addTitleToList() async {
    if (textController.text.isNotEmpty) {
      await ListDataBase.instance.add(
        ListInterface(
          title: textController.text,
          content: '',
          checkBox: false,
          position: 1,
        ),
      );
    }

    setState(() {
      textController.clear();
      FocusManager.instance.primaryFocus?.unfocus(); // Dismiss Keyboard
    });
  }

  deleteAll() async {
    // await ListDataBase.instance.removeAll();
    setState(() {});
  }
}
