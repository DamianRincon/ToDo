import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Function onPress;
  final IconData icon; 
  final String title; 
  final bool active;

  const DrawerItem({
    Key key, 
    this.onPress, 
    this.active = false, 
    this.icon, 
    this.title = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        decoration: active ? BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.deepPurple[50],
        ) : null,
        child: ListTile(
          leading: Icon(icon, color: active ? Color(0xff2A024A): null),
          title: Text(title, style: active ? TextStyle(color: Colors.black) : TextStyle())
        )
      )
    );
  }
}