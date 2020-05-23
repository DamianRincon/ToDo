import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class TaskPage extends StatelessWidget {
  const TaskPage({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tasks", style: TextStyle(fontSize: 25)),
                  IconButton(icon: Icon(Icons.filter_list), onPressed: (){})
                ],
              ),
            ),
            ExpansionTile(
              trailing: Container(height: 0, width: 0),
              title: Text("25/04/2020"),
              children: <Widget>[
                Container(
                  child: DatePicker(
                    DateTime.now().add(Duration(days: -3)),
                    width: 60,
                    height: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Color(0xff2A024A),
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
      
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (c,i){
                  return ListTile(
                    leading: CircularCheckBox(
                      activeColor: Color(0xff2A024A),
                      value: i%2 == 0,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onChanged: (bool x) {
                      }
                    ),
                    title: Text("Tarea $i"),
                  );
                }
              )
            )
          ],
        ),
        Positioned(
          bottom: 16,
          right: 0,
          child: Container(
            height: 50,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff2A024A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25)
              )
            ),
            child: InkWell(
              onTap: (){},
              child: Icon(Icons.add, color: Colors.white),
            ),
          )
        )
      ]
    );
  }
}