// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inclined_plane_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InclinedPlaneDataAdapter extends TypeAdapter<InclinedPlaneData> {
  @override
  final typeId = 4;

  @override
  InclinedPlaneData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InclinedPlaneData(
      name: fields[7] as String,
      id: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InclinedPlaneData obj) {
    writer
      ..writeByte(9)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.angle)
      ..writeByte(2)
      ..write(obj.average)
      ..writeByte(3)
      ..write(obj.delta)
      ..writeByte(4)
      ..write(obj.maximum)
      ..writeByte(5)
      ..write(obj.minimum)
      ..writeByte(6)
      ..write(obj.monthValues);
  }
}
