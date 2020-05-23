// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrashAdapter extends TypeAdapter<Trash> {
  @override
  final typeId = 1;

  @override
  Trash read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Trash(
      fields[0] as String,
      fields[1] as Task,
    );
  }

  @override
  void write(BinaryWriter writer, Trash obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._date)
      ..writeByte(1)
      ..write(obj._task);
  }
}
