import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:mobx/mobx.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../app_controller.dart';
import '../../shared/utils/constants.dart';
import 'repositories/home_repository.dart';

part 'home_controller.g.dart';

//ignore: public_member_api_docs
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository = Modular.get();
  final AppController appController = Modular.get();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  ProgressDialog loadingDialog;

  @observable
  String state;

  @observable
  String city;

  @observable
  bool loadingCity = false;

  @observable
  bool loading = false;

  @observable
  String loadingMessage = "Carregando...";

  @observable
  String errorMessage;

  @observable
  Position position;

  @observable
  ObservableList<String> cities;

  // ignore: use_setters_to_change_properties
  @action
  void changeState(String newValue) {
    state = newValue;
  }

  // ignore: use_setters_to_change_properties
  @action
  void changeCity(String newValue) => city = newValue;

  @action
  void selectedState(String value) {
    state = value;
    city = null;
    if (state != null) {
      getCities(statesBrasil[state]);
    }
  }

  @action
  Future<void> getCities(String idState) async {
    loadingCity = true;
    var value = await repository.fetchStateCities(idState);
    value.sort();
    cities = value.asObservable();
    loadingCity = false;
  }

  @action
  Future<void> getLocation() async {
    loadingMessage = "Obtendo sua localização, por favor aguarde...";
    await loadingDialog.show();

    if (await LocationPermissions().checkPermissionStatus() ==
        PermissionStatus.denied) {
      await LocationPermissions().requestPermissions();
    }
    switch (await LocationPermissions().checkPermissionStatus()) {
      case PermissionStatus.denied:
        errorMessage = "Você precisar permitir a localização";
        break;
      case PermissionStatus.granted:
        if (await geolocator.isLocationServiceEnabled()) {
          try {
            position = await geolocator
                .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium)
                .timeout(Duration(seconds: 10), onTimeout: () async {
              return await geolocator.getLastKnownPosition();
            });
            print("POSITION");
            print(position?.latitude);
            print(position?.longitude);
            print("---------------------");
            await setDataCoordinate();
          } on PlatformException catch (e) {
            print("DESCONHECIDO PL");
            print(e.code);
            print(e.message);
            print(e.details);
            print("---------------------");
          } on Exception catch (e) {
            print("DESCONHECIDO DEFAULT");
            print(e.toString());
            print("---------------------");
          } finally {
            await loadingDialog.hide();
          }
        } else {
          errorMessage = "Você precisa ativar a localização";
        }
        break;
      default:
        errorMessage = "Ocorreu um erro, tente novamente mais tarde";
    }
    await loadingDialog.hide();
  }

  @action
  Future<void> setDataCoordinate() async {
    loadingMessage = "Obtendo os dados...";
    await appController.searchCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    await loadingDialog.hide();
    Modular.to.pushReplacementNamed('/dashboard');
  }

  @action
  Future<void> setDataLocale() async {
    if (state == null) {
      errorMessage = "Você precisa selecionar um estado";
    } else if (city == null) {
      errorMessage = "Você precisa selecionar uma cidade";
    } else {
      try {
        loadingMessage = "Obtendo os dados...";
        await loadingDialog.show();
        await appController.searchCity(
          state: state,
          city: city,
        );
        await loadingDialog.hide();
        Modular.to.pushReplacementNamed('/dashboard');
      } on DioError catch (e) {
        errorMessage = e.message;
      } on Exception catch (_) {
        errorMessage = "Ocorreu um erro, por favor tente novamente...";
      } finally {
        await loadingDialog.hide();
      }
    }
  }

  @action
  void setLoadingDialogMessage() {
    loadingDialog.update(message: loadingMessage);
  }
}
