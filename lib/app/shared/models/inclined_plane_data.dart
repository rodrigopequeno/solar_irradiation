import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'solar_irradiation_data.dart';

part 'inclined_plane_data.g.dart';

/// Represents the inclined plane data for a location
@immutable
@HiveType(typeId: 4)
class InclinedPlaneData extends SolarIrradiationData {
  @HiveField(7)
  //ignore: public_member_api_docs
  final String name;
  @HiveField(8)
  //ignore: public_member_api_docs
  final String id;
  //ignore: public_member_api_docs
  InclinedPlaneData({
    this.name,
    this.id,
    String title,
    int angle,
    List<double> monthValues,
    double maximum,
    double minimum,
    double average,
    double delta,
  }) : super(
          title: title,
          angle: angle,
          monthValues: monthValues,
          maximum: maximum,
          minimum: minimum,
          average: average,
          delta: delta,
        );

  @override
  SolarIrradiationData copyWith({
    String title,
    int angle,
    List<double> monthValues,
    double average,
    double delta,
    double maximum,
    double minimum,
  }) {
    return InclinedPlaneData(
      title: title ?? this.title,
      angle: angle ?? this.angle,
      name: name ?? name,
      id: id ?? id,
      monthValues: monthValues ?? this.monthValues,
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
      average: average ?? this.average,
      delta: delta ?? this.delta,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'angle': angle,
      'name': name,
      'id': id,
      'monthValues': monthValues,
      'maximum': maximum,
      'minimum': minimum,
      'average': average,
      'delta': delta,
    };
  }

  //ignore: public_member_api_docs
  static InclinedPlaneData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return InclinedPlaneData(
      title: map['titulo'],
      angle: int.parse(map['angulo']),
      name: map['nome'],
      id: map['id'],
      monthValues: List.from([
        double.parse(map['jan']),
        double.parse(map['fev']),
        double.parse(map['mar']),
        double.parse(map['abr']),
        double.parse(map['mai']),
        double.parse(map['jun']),
        double.parse(map['jul']),
        double.parse(map['ago']),
        double.parse(map['set']),
        double.parse(map['out']),
        double.parse(map['nov']),
        double.parse(map['dez']),
      ]),
      maximum: double.parse(map['max']),
      minimum: double.parse(map['min']),
      average: double.parse(map['media']),
      delta: double.parse(map['delta']),
    );
  }

  @override
  String toString() {
    return """InclinedPlaneData(title: $title, angle: $angle, name: $name, id: $id, jan: ${monthValues[0]}, fev: ${monthValues[1]}, mar: ${monthValues[2]}, abr: ${monthValues[3]}, mai: ${monthValues[4]}, jun: ${monthValues[5]}, jul: ${monthValues[6]}, ago: ${monthValues[7]}, set: ${monthValues[8]}, out: ${monthValues[9]}, nov: ${monthValues[10]}, dez: ${monthValues[11]}, maximum: $maximum, minimum: $minimum, average: $average, delta: $delta)""";
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InclinedPlaneData &&
        o.title == title &&
        o.angle == angle &&
        o.name == name &&
        o.id == id &&
        o.monthValues == monthValues &&
        o.maximum == maximum &&
        o.minimum == minimum &&
        o.average == average &&
        o.delta == delta;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        angle.hashCode ^
        name.hashCode ^
        id.hashCode ^
        monthValues.hashCode ^
        maximum.hashCode ^
        minimum.hashCode ^
        average.hashCode ^
        delta.hashCode;
  }
}
