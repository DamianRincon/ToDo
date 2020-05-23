import 'package:ToDo/src/model/task.dart';
import 'package:hive/hive.dart';

part 'trash.g.dart';

@HiveType(typeId: 1)
class Trash extends HiveObject {
  
  @HiveField(0)
  String _date;
  @HiveField(1)
  Task _task;

  String get getDate => _date;
  Task get getTask => _task;

  Trash(this._date, this._task);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      "date" : this._date,
      "task" : this._task
    };
    return map;
  }

  Trash.fromMap(Map<String, dynamic> map){
    this._date = map['date'];
    this._task = map['task'];
  }

  @override
  String toString() => _task.getContent;
}