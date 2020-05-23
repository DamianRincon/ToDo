import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  
  @HiveField(0)
  String _date;
  @HiveField(1)
  String _content;
  @HiveField(2)
  bool _complete;

  String get getDate => _date;
  String get getContent => _content;
  bool get getStatus => _complete;

  void setState(val) => _complete = val;

  Task(this._date, this._content, this._complete);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      "date" : this._date,
      "content" : this._content,
      "complete" : this._complete
    };
    return map;
  }

  Task.fromMap(Map<String, dynamic> map){
    this._date = map['date'];
    this._content = map['content'];
    this._complete = map['complete'];
  }

  @override
  String toString() => _content;
}