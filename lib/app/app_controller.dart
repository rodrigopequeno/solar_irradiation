import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

import 'repositories/app_repository.dart';
import 'shared/models/coordinate.dart';
import 'shared/models/horizontal_plane_data.dart';
import 'shared/models/inclined_plane_data.dart';
import 'shared/models/locale.dart';

part 'app_controller.g.dart';

//ignore: public_member_api_docs
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final AppRepository repository = Modular.get();
  @observable
  Coordinate currentCoordinate;

  @observable
  List<Locale> locales;

  @observable
  String state;

  @observable
  String city;

  @action
  String getTitle() => "$city/$state";

  _AppControllerBase() {
    Hive.initFlutter();
    registerAdapters();
  }

  void registerAdapters() {
    try {
      Hive.registerAdapter(CoordinateAdapter());
      Hive.registerAdapter(LocaleAdapter());
      Hive.registerAdapter(InclinedPlaneDataAdapter());
      Hive.registerAdapter(HorizontalPlaneDataAdapter());
    } on HiveError catch (e) {
      print(e);
    } on Exception catch (_) {
      print("REGISTER ERROR");
    }
  }

  Future<bool> hasData() async {
    return await repository.hasData();
  }

  @action
  Future<void> searchCoordinates(
      {@required double latitude, @required double longitude}) async {
    try {
      final data = await repository.searchCoordinates(latitude, longitude);
      currentCoordinate = data['coordinate'];
      locales = data['locales'];
      var placemark =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);
      city = placemark.first.subAdministrativeArea;
      state = placemark.first.administrativeArea;
      saveToDisk();
      repository.changeHasData(newValueHasData: true);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @action
  Future<void> searchCity(
      {@required String state, @required String city}) async {
    try {
      final data = await repository.searchCity(state, city);
      currentCoordinate = data['coordinate'];
      locales = data['locales'];
      this.state = state;
      this.city = city;
      saveToDisk();
      repository.changeHasData(newValueHasData: true);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @action
  Future<void> loadFromDisk() async {
    city = await repository.loadCity();
    state = await repository.loadState();
    currentCoordinate = await repository.loadCurrentCoordinate();

    /// Hive problem [https://github.com/hivedb/hive/issues/236]
    // locales = await repository.loadLocales();
    var data = await repository.searchCoordinates(
        currentCoordinate.latitude, currentCoordinate.longitude);
    locales = data['locales'];
  }

  void deleteFromDisk() async {
    await repository.deleteCityState();
    await repository.deleteCurrentCoordinate();

    /// Hive problem [https://github.com/hivedb/hive/issues/236]
    // await repository.deleteLocales();
    repository.changeHasData(newValueHasData: false);
    currentCoordinate = null;
    city = null;
    state = null;
    locales = null;
  }

  void saveToDisk() async {
    await repository.saveCity(city);
    await repository.saveState(state);
    await repository.saveCurrentCoordinate(currentCoordinate);

    /// Hive problem [https://github.com/hivedb/hive/issues/236]
    // await repository.saveLocales(locales);
  }
}
