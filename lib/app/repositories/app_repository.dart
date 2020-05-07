import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../shared/models/coordinate.dart';
import '../shared/models/locale.dart';
import '../shared/utils/constants.dart';
import 'app_repository_interface.dart';

//ignore: public_member_api_docs
class AppRepository extends Disposable implements IAppRepository {
  //ignore: public_member_api_docs
  final Dio client;
  //ignore: public_member_api_docs
  AppRepository(this.client);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<Map<String, dynamic>> searchCoordinates(
      double latitude, double longitude) async {
    final response = await client.get(
        'https://solar-irradiation.herokuapp.com/coordinate?longitude=$longitude&latitude=$latitude');
    return {
      "coordinate": Coordinate.fromMap(response.data['coordenada']),
      "locales": (response.data['ponto'] as List)
          //ignore: unnecessary_lambdas
          .map((e) => Locale.fromMap(e))
          .toList(),
    };
  }

  @override
  Future<Map<String, dynamic>> searchCity(String state, String city) async {
    final response = await client.get(
        'https://solar-irradiation.herokuapp.com/location?state=$state&city=$city');
    return {
      "coordinate": Coordinate.fromMap(response.data['coordenada']),
      "locales": (response.data['ponto'] as List)
          //ignore: unnecessary_lambdas
          .map((e) => Locale.fromMap(e))
          .toList(),
    };
  }

  @override
  Future<void> saveCity(String city) async {
    var boxCityState = await Hive.openBox<String>(boxCityStateName);
    boxCityState.put('city', city);
  }

  @override
  Future<void> saveCurrentCoordinate(Coordinate current) async {
    var boxCoordinate =
        await Hive.openBox<Coordinate>(boxCurrentCoordinateName);
    boxCoordinate.put(boxCurrentCoordinateName, current);
  }

  @override
  Future<void> saveLocales(List<Locale> locales) async {
    var boxLocales = await Hive.openBox<List<Locale>>(boxLocalesName);
    boxLocales.put(boxLocalesName, locales);
  }

  @override
  Future<void> saveState(String state) async {
    var boxCityState = await Hive.openBox<String>(boxCityStateName);
    boxCityState.put('state', state);
  }

  @override
  Future<void> deleteCityState() async {
    var boxCityState = await Hive.openBox<String>(boxCityStateName);
    boxCityState.deleteFromDisk();
  }

  @override
  Future<void> deleteCurrentCoordinate() async {
    var boxCoordinate =
        await Hive.openBox<Coordinate>(boxCurrentCoordinateName);
    boxCoordinate.deleteFromDisk();
  }

  @override
  Future<void> deleteLocales() async {
    var boxLocales = await Hive.openBox<List<Locale>>(boxLocalesName);
    boxLocales.deleteFromDisk();
  }

  @override
  Future<String> loadCity() async {
    var boxCityState = await Hive.openBox<String>(boxCityStateName);
    var city = boxCityState.get('city');
    return city;
  }

  @override
  Future<Coordinate> loadCurrentCoordinate() async {
    var boxCoordinate =
        await Hive.openBox<Coordinate>(boxCurrentCoordinateName);
    var current = boxCoordinate.get(boxCurrentCoordinateName);
    return current;
  }

  @override
  Future<List<Locale>> loadLocales() async {
    var boxLocales = await Hive.openBox<List>(boxLocalesName);
    var locales = boxLocales.get(boxLocalesName);
    return locales;
  }

  @override
  Future<String> loadState() async {
    var boxCityState = await Hive.openBox<String>(boxCityStateName);
    var state = boxCityState.get('state');
    return state;
  }

  @override
  void changeHasData({@required bool newValueHasData}) async {
    var boxLoaded = await Hive.openBox<bool>(boxLoadedName);
    boxLoaded.put(boxLoadedName, newValueHasData);
  }

  @override
  Future<bool> hasData() async {
    var boxLoaded = await Hive.openBox<bool>(boxLoadedName);
    var first = boxLoaded.get(boxLoadedName);
    return first ?? false;
  }
}
