import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/models/coordinate.dart';
import '../shared/models/locale.dart';

//ignore: public_member_api_docs
abstract class IAppRepository extends Disposable {
  /// Consultation of data based on geographic coordinates
  Future<Map<String, dynamic>> searchCoordinates(
      double latitude, double longitude);

  ///Consultation of data based on state and city
  Future<Map<String, dynamic>> searchCity(String state, String city);

  /// Changes the value whether or not there is data
  void changeHasData({@required bool newValueHasData});

  /// Queries whether you have saved data or not
  Future<bool> hasData();

  /// Loads the geographic coordinate data of the selected point
  Future<Coordinate> loadCurrentCoordinate();

  /// Load the data for the selected point
  Future<List<Locale>> loadLocales();

  /// Load state of selected point
  Future<String> loadState();

  /// Load city of selected point
  Future<String> loadCity();

  /// Saves the geographic coordinate of the selected point
  void saveCurrentCoordinate(Coordinate current);

  /// Save the data for the selected point
  void saveLocales(List<Locale> locales);

  /// Save city of selected point
  void saveCity(String city);

  /// Save state of selected point
  void saveState(String state);

  /// Delete the geographic coordinate of the selected point
  void deleteCurrentCoordinate();

  /// Delete the data for the selected point
  void deleteLocales();

  /// Delete city and state of selected point
  void deleteCityState();
}
