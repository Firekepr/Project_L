import 'package:flutter/material.dart';
import 'package:project_l/database/list.database.dart';
import 'package:project_l/interface/List-interface.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          await ListDataBase.instance.add(
            ListInterface(
              title: textController.text,
              content: '',
              checkBox: false,
              position: 1,
            ),
          );

          setState(() {
            textController.clear();
          });
        },
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
                      return Center(
                        child: ListTile(
                          title: Text(list.title),
                          subtitle: list.content.isNotEmpty
                              ? Text(list.content)
                              : Container(),
                        ),
                      );
                    }).toList(),
                  )
                : Container();
          }),
    );
  }
}
