import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'horizontal_plane_data.dart';
import 'inclined_plane_data.dart';

part 'locale.g.dart';

/// Represents data for a location
@HiveType(typeId: 8)
class Locale extends HiveObject {
  @HiveField(0)
  //ignore: public_member_api_docs
  final String id;
  @HiveField(1)
  //ignore: public_member_api_docs
  final double latitude;
  @HiveField(2)
  //ignore: public_member_api_docs
  final double longitude;
  @HiveField(3)
  //ignore: public_member_api_docs
  final String city;
  @HiveField(4)
  //ignore: public_member_api_docs
  final String station;
  @HiveField(5)
  //ignore: public_member_api_docs
  final String locality;
  @HiveField(6)
  //ignore: public_member_api_docs
  final int idCensolar;
  @HiveField(7)
  //ignore: public_member_api_docs
  final String uf;
  @HiveField(8)
  //ignore: public_member_api_docs
  final int idCountryIbge;
  @HiveField(9)
  //ignore: public_member_api_docs
  final int idUfIbge;
  @HiveField(10)
  //ignore: public_member_api_docs
  final int idCityIbge;
  @HiveField(11)
  //ignore: public_member_api_docs
  final String country;
  @HiveField(12)
  //ignore: public_member_api_docs
  final String font;
  @HiveField(13)
  //ignore: public_member_api_docs
  final double distance;
  @HiveField(14)
  //ignore: public_member_api_docs
  final HorizontalPlaneData horizontalPlaneData;
  @HiveField(15)
  //ignore: public_member_api_docs
  final List<InclinedPlaneData> inclinedPlaneData;

  //ignore: public_member_api_docs
  Locale({
    this.id,
    this.latitude,
    this.longitude,
    this.city,
    this.station,
    this.locality,
    this.idCensolar,
    this.uf,
    this.idCountryIbge,
    this.idUfIbge,
    this.idCityIbge,
    this.country,
    this.font,
    this.distance,
    this.horizontalPlaneData,
    this.inclinedPlaneData,
  });

  //ignore: public_member_api_docs
  Locale copyWith({
    String id,
    double latitude,
    double longitude,
    String city,
    String station,
    String locality,
    int idCensolar,
    String uf,
    int idCountryIbge,
    int idUfIbge,
    int idCityIbge,
    String country,
    String font,
    double distance,
    HorizontalPlaneData horizontalPlaneData,
    List<InclinedPlaneData> inclinedPlaneData,
  }) {
    return Locale(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city,
      station: station ?? this.station,
      locality: locality ?? this.locality,
      idCensolar: idCensolar ?? this.idCensolar,
      uf: uf ?? this.uf,
      idCountryIbge: idCountryIbge ?? this.idCountryIbge,
      idUfIbge: idUfIbge ?? this.idUfIbge,
      idCityIbge: idCityIbge ?? this.idCityIbge,
      country: country ?? this.country,
      font: font ?? this.font,
      distance: distance ?? this.distance,
      horizontalPlaneData: horizontalPlaneData ?? this.horizontalPlaneData,
      inclinedPlaneData: inclinedPlaneData ?? this.inclinedPlaneData,
    );
  }

  //ignore: public_member_api_docs
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'station': station,
      'locality': locality,
      'idCensolar': idCensolar,
      'uf': uf,
      'idCountryIbge': idCountryIbge,
      'idUfIbge': idUfIbge,
      'idCityIbge': idCityIbge,
      'country': country,
      'font': font,
      'distance': distance,
      'horizontalPlaneData': horizontalPlaneData,
      'solarIrradiation':
          List<dynamic>.from(inclinedPlaneData.map((x) => x.toMap())),
    };
  }

  //ignore: public_member_api_docs
  static Locale fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Locale(
      id: map['id'],
      latitude: double.parse(map['latitude']),
      longitude: double.parse(map['longitude']),
      city: map['municipio'],
      station: map['estacao'],
      locality: map['localidade'],
      idCensolar: int.parse(map['id_censolar']),
      uf: map['uf'] is String ? map['uf'] : '',
      idCountryIbge: int.parse(map['id_pais_ibge']),
      idUfIbge: int.parse(map['id_uf_ibge']),
      idCityIbge: int.parse(map['id_mun_ibge']),
      country: map['pais'] is String ? map['pais'] : '',
      font: map['font'],
      distance: double.parse(map['distancia']),
      horizontalPlaneData: HorizontalPlaneData.fromMap(map['rph']),
      inclinedPlaneData: List<InclinedPlaneData>.from(
          //ignore: unnecessary_lambdas
          map['rpi']?.map((e) => InclinedPlaneData.fromMap(e))),
    );
  }

  //ignore: public_member_api_docs
  String toJson() => json.encode(toMap());

  //ignore: public_member_api_docs
  static Locale fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return """Locale(id: $id, latitude: $latitude, longitude: $longitude, city: $city, station: $station, locality: $locality, idCensolar: $idCensolar, uf: $uf, idCountryIbge: $idCountryIbge, idUfIbge: $idUfIbge, idCityIbge: $idCityIbge, country: $country, font: $font, distance: $distance, horizontalPlaneData: $horizontalPlaneData, inclinedPlaneData: $inclinedPlaneData)""";
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Locale &&
        o.id == id &&
        o.latitude == latitude &&
        o.longitude == longitude &&
        o.city == city &&
        o.station == station &&
        o.locality == locality &&
        o.idCensolar == idCensolar &&
        o.uf == uf &&
        o.idCountryIbge == idCountryIbge &&
        o.idUfIbge == idUfIbge &&
        o.idCityIbge == idCityIbge &&
        o.country == country &&
        o.font == font &&
        o.distance == distance &&
        o.horizontalPlaneData == horizontalPlaneData &&
        listEquals(o.inclinedPlaneData, inclinedPlaneData);
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        city.hashCode ^
        station.hashCode ^
        locality.hashCode ^
        idCensolar.hashCode ^
        uf.hashCode ^
        idCountryIbge.hashCode ^
        idUfIbge.hashCode ^
        idCityIbge.hashCode ^
        country.hashCode ^
        font.hashCode ^
        distance.hashCode ^
        horizontalPlaneData.hashCode ^
        inclinedPlaneData.hashCode;
  }
}
