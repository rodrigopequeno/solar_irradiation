import 'package:hive/hive.dart';
import 'solar_irradiation_data.dart';

part 'horizontal_plane_data.g.dart';

/// Represents the horizontal plane data for a location
@HiveType(typeId: 3)
class HorizontalPlaneData extends SolarIrradiationData {
  //ignore: public_member_api_docs
  HorizontalPlaneData({
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
  SolarIrradiationData copyWith(
      {String title,
      int angle,
      List<double> monthValues,
      double average,
      double delta,
      double maximum,
      double minimum}) {
    return HorizontalPlaneData(
      title: title ?? this.title,
      angle: angle ?? this.angle,
      monthValues: monthValues ?? this.monthValues,
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
      average: average ?? this.average,
      delta: delta ?? this.delta,
    );
  }

  //ignore: public_member_api_docs
  static HorizontalPlaneData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HorizontalPlaneData(
      title: map['titulo'],
      angle: int.parse(map['angulo']),
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
    return """HorizontalPlaneData(title: $title, angle: $angle, jan: ${monthValues[0]}, fev: ${monthValues[1]}, mar: ${monthValues[2]}, abr: ${monthValues[3]}, mai: ${monthValues[4]}, jun: ${monthValues[5]}, jul: ${monthValues[6]}, ago: ${monthValues[7]}, set: ${monthValues[8]}, out: ${monthValues[9]}, nov: ${monthValues[10]}, dez: ${monthValues[11]},  maximum: $maximum, minimum: $minimum, average: $average, delta: $delta)""";
  }
}
