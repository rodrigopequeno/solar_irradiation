// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocaleAdapter extends TypeAdapter<Locale> {
  @override
  final typeId = 8;

  @override
  Locale read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Locale(
      id: fields[0] as String,
      latitude: fields[1] as double,
      longitude: fields[2] as double,
      city: fields[3] as String,
      station: fields[4] as String,
      locality: fields[5] as String,
      idCensolar: fields[6] as int,
      uf: fields[7] as String,
      idCountryIbge: fields[8] as int,
      idUfIbge: fields[9] as int,
      idCityIbge: fields[10] as int,
      country: fields[11] as String,
      font: fields[12] as String,
      distance: fields[13] as double,
      horizontalPlaneData: fields[14] as HorizontalPlaneData,
      inclinedPlaneData: (fields[15] as List)?.cast<InclinedPlaneData>(),
    );
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.station)
      ..writeByte(5)
      ..write(obj.locality)
      ..writeByte(6)
      ..write(obj.idCensolar)
      ..writeByte(7)
      ..write(obj.uf)
      ..writeByte(8)
      ..write(obj.idCountryIbge)
      ..writeByte(9)
      ..write(obj.idUfIbge)
      ..writeByte(10)
      ..write(obj.idCityIbge)
      ..writeByte(11)
      ..write(obj.country)
      ..writeByte(12)
      ..write(obj.font)
      ..writeByte(13)
      ..write(obj.distance)
      ..writeByte(14)
      ..write(obj.horizontalPlaneData)
      ..writeByte(15)
      ..write(obj.inclinedPlaneData);
  }
}
