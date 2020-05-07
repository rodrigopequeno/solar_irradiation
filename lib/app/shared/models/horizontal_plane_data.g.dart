// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horizontal_plane_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HorizontalPlaneDataAdapter extends TypeAdapter<HorizontalPlaneData> {
  @override
  final typeId = 3;

  @override
  HorizontalPlaneData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HorizontalPlaneData();
  }

  @override
  void write(BinaryWriter writer, HorizontalPlaneData obj) {
    writer
      ..writeByte(7)
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
