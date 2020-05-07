import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'coordinate.g.dart';

/// Represents a geographical coordinate
@immutable
@HiveType(typeId: 10)
class Coordinate {
  @HiveField(0)
  //ignore: public_member_api_docs
  final double longitude;
  @HiveField(1)
  //ignore: public_member_api_docs
  final double latitude;

  //ignore: public_member_api_docs
  Coordinate({
    this.longitude,
    this.latitude,
  });

  //ignore: public_member_api_docs
  Coordinate copyWith({
    double longitude,
    double latitude,
  }) {
    return Coordinate(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  //ignore: public_member_api_docs
  Map<String, dynamic> toMap() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  //ignore: public_member_api_docs
  static Coordinate fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Coordinate(
      longitude: double.parse(map['longitude']),
      latitude: double.parse(map['latitude']),
    );
  }

  //ignore: public_member_api_docs
  String toJson() => json.encode(toMap());

  //ignore: public_member_api_docs
  static Coordinate fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Coordinate(longitude: $longitude, latitude: $latitude)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Coordinate &&
        o.longitude == longitude &&
        o.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}
