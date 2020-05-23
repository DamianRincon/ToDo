import 'package:flutter/material.dart';
import 'package:ToDo/src/view/task_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tareas"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: TaskPage(),
    );
  }
}