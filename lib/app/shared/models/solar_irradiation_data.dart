import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@immutable
// @HiveType(typeId: 2)
/// Models solar radiation data for a location
abstract class SolarIrradiationData {
  @HiveField(0)
  //ignore: public_member_api_docs
  final String title;
  @HiveField(1)
  //ignore: public_member_api_docs
  final int angle;
  @HiveField(2)
  //ignore: public_member_api_docs
  final double average;
  @HiveField(3)
  //ignore: public_member_api_docs
  final double delta;
  @HiveField(4)
  //ignore: public_member_api_docs
  final double maximum;
  @HiveField(5)
  //ignore: public_member_api_docs
  final double minimum;
  @HiveField(6)
  //ignore: public_member_api_docs
  final List<double> monthValues;

  //ignore: public_member_api_docs
  SolarIrradiationData({
    this.title,
    this.angle,
    this.monthValues,
    this.average,
    this.delta,
    this.maximum,
    this.minimum,
  });

  //ignore: public_member_api_docs
  SolarIrradiationData copyWith({
    String title,
    int angle,
    List<double> monthValues,
    double average,
    double delta,
    double maximum,
    double minimum,
  });

  //ignore: public_member_api_docs
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'angle': angle,
      'monthValues': monthValues,
      'average': average,
      'delta': delta,
      'maximum': maximum,
      'minimum': minimum,
    };
  }

  //ignore: public_member_api_docs
  factory SolarIrradiationData.fromMap(Map<String, dynamic> map) {
    return null;
  }

  //ignore: public_member_api_docs
  String toJson() => json.encode(toMap());

  //ignore: public_member_api_docs
  factory SolarIrradiationData.fromJson(String source) =>
      SolarIrradiationData.fromMap(json.decode(source));

  @override
  String toString() {
    return """SolarIrradiationData(title: $title, angle: $angle, jan: ${monthValues[0]}, fev: ${monthValues[1]}, mar: ${monthValues[2]}, abr: ${monthValues[3]}, mai: ${monthValues[4]}, jun: ${monthValues[5]}, jul: ${monthValues[6]}, ago: ${monthValues[7]}, set: ${monthValues[8]}, out: ${monthValues[9]}, nov: ${monthValues[10]}, dez: ${monthValues[11]},  maximum: $maximum, minimum: $minimum, average: $average, delta: $delta)""";
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SolarIrradiationData &&
        o.title == title &&
        o.angle == angle &&
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
        monthValues.hashCode ^
        maximum.hashCode ^
        minimum.hashCode ^
        average.hashCode ^
        delta.hashCode;
  }
}
