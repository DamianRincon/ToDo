import '../home/task_page.dart';
import '../home/trash_page.dart';
import '../../widget/drawer_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int defaultItem = 0;

  getBody(){
    return defaultItem == 0 ? TaskPage() : TrashPage();
  }

  changeStatus(index){
    setState(() {
      defaultItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        centerTitle: true,
      ),
      
      drawer: Drawer(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(      
            children: <Widget>[
              Container(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: Text("ToDo List App", style: TextStyle(fontSize: 26))),
                ),
              ),
              DrawerItem(
                title: "Tareas",
                onPress: (){
                  changeStatus(0);
                  Navigator.pop(context);
                },
                icon: Icons.today,
                active: defaultItem==0,
              ),
              DrawerItem(
                title: "Papelera",
                onPress: (){
                  changeStatus(1);
                  Navigator.pop(context);
                },
                icon: Icons.delete_outline,
                active: defaultItem==1,
              ),
              Container(
                color: Colors.grey[300],
                height: 0.5,
                margin: EdgeInsets.all(20.0),
              ),
              DrawerItem(
                title: "Ayuda y comentarios",
                onPress: (){},
                icon: Icons.info_outline,
              )
            ]
          )
        )
      ),
      body: getBody(),
    );
  }
}