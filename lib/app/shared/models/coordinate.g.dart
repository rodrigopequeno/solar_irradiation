// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordinateAdapter extends TypeAdapter<Coordinate> {
  @override
  final typeId = 10;

  @override
  Coordinate read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coordinate(
      longitude: fields[0] as double,
      latitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Coordinate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.longitude)
      ..writeByte(1)
      ..write(obj.latitude);
  }
}
