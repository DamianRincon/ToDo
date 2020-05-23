import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ToDo/src/model/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ToDo/src/view/newtask_page.dart';
import 'package:ToDo/src/provider/app_provider.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class TaskPage extends StatelessWidget {
  TaskPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    AppProvider app = Provider.of<AppProvider>(context);

    return Theme(
      data: app.theme,
      child: Scaffold(
        floatingActionButton: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> NewTaskPage())),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.add, color: Colors.white)
            )
          )
        ),
        body: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text(app.date.split(" ")[0]),
              children: <Widget>[
                Container(
                  child: DatePicker(
                    DateTime.now().add(Duration(days: -2)),
                    width: 60,
                    height: 90,
                    initialSelectedDate: DateTime.parse(app.date),
                    selectionColor: Color(0xff2A024A),
                    onDateChange: (date) {
                      app.setDate(date.toString());
                    }
                  )
                )
              ]
            ),
            Expanded(
              child: WatchBoxBuilder(
                box: Hive.box('task'),
                builder: (BuildContext context, Box taskBox){
                  List<Task> _tasks = List<Task>();
                    
                  for (var item in taskBox.values) {
                    if (item.getDate.split(" ")[0] == app.date.split(" ")[0]) {
                      _tasks.add(item);
                    }
                  }

                  if (_tasks.length>=1) {
                    return ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (c, i){
                        Task t = _tasks[i];
                        return ListTile(
                          leading: CircularCheckBox(
                            activeColor: Color(0xff2A024A),
                            value: t.getStatus,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            onChanged: (v){
                              t.setState(v);
                              t.save();
                            }
                          ),
                          title: Text(t.getContent),
                        );
                      }
                    );
                  }else{
                    return Center(child: Text("Sin Tareas aún"));
                  }
                }
              )
            )
          ]
        )
      )
    );
  }
}