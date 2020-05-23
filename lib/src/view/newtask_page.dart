import 'package:ToDo/src/model/task.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NewTaskPage extends StatefulWidget {
  NewTaskPage({Key key}) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController _controller = TextEditingController();
  Box task = Hive.box('task');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Guardar"),
        icon: Icon(Icons.save),
        onPressed: (){
          task.add(Task(DateTime.now().toString(), _controller.text, false))
            .then((value) => Navigator.pop(context));
        }
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: TextField(
          controller: _controller,
          autofocus: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tarea"
          )
        )
      )
    );
  }
}