// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stateAtom = Atom(name: '_HomeControllerBase.state');

  @override
  String get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_HomeControllerBase.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$loadingCityAtom = Atom(name: '_HomeControllerBase.loadingCity');

  @override
  bool get loadingCity {
    _$loadingCityAtom.context.enforceReadPolicy(_$loadingCityAtom);
    _$loadingCityAtom.reportObserved();
    return super.loadingCity;
  }

  @override
  set loadingCity(bool value) {
    _$loadingCityAtom.context.conditionallyRunInAction(() {
      super.loadingCity = value;
      _$loadingCityAtom.reportChanged();
    }, _$loadingCityAtom, name: '${_$loadingCityAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$loadingMessageAtom = Atom(name: '_HomeControllerBase.loadingMessage');

  @override
  String get loadingMessage {
    _$loadingMessageAtom.context.enforceReadPolicy(_$loadingMessageAtom);
    _$loadingMessageAtom.reportObserved();
    return super.loadingMessage;
  }

  @override
  set loadingMessage(String value) {
    _$loadingMessageAtom.context.conditionallyRunInAction(() {
      super.loadingMessage = value;
      _$loadingMessageAtom.reportChanged();
    }, _$loadingMessageAtom, name: '${_$loadingMessageAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_HomeControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$positionAtom = Atom(name: '_HomeControllerBase.position');

  @override
  Position get position {
    _$positionAtom.context.enforceReadPolicy(_$positionAtom);
    _$positionAtom.reportObserved();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.context.conditionallyRunInAction(() {
      super.position = value;
      _$positionAtom.reportChanged();
    }, _$positionAtom, name: '${_$positionAtom.name}_set');
  }

  final _$citiesAtom = Atom(name: '_HomeControllerBase.cities');

  @override
  ObservableList<String> get cities {
    _$citiesAtom.context.enforceReadPolicy(_$citiesAtom);
    _$citiesAtom.reportObserved();
    return super.cities;
  }

  @override
  set cities(ObservableList<String> value) {
    _$citiesAtom.context.conditionallyRunInAction(() {
      super.cities = value;
      _$citiesAtom.reportChanged();
    }, _$citiesAtom, name: '${_$citiesAtom.name}_set');
  }

  final _$getCitiesAsyncAction = AsyncAction('getCities');

  @override
  Future<void> getCities(String idState) {
    return _$getCitiesAsyncAction.run(() => super.getCities(idState));
  }

  final _$getLocationAsyncAction = AsyncAction('getLocation');

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  final _$setDataCoordinateAsyncAction = AsyncAction('setDataCoordinate');

  @override
  Future<void> setDataCoordinate() {
    return _$setDataCoordinateAsyncAction.run(() => super.setDataCoordinate());
  }

  final _$setDataLocaleAsyncAction = AsyncAction('setDataLocale');

  @override
  Future<void> setDataLocale() {
    return _$setDataLocaleAsyncAction.run(() => super.setDataLocale());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void changeState(String newValue) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeState(newValue);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCity(String newValue) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeCity(newValue);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedState(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.selectedState(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingDialogMessage() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setLoadingDialogMessage();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'state: ${state.toString()},city: ${city.toString()},loadingCity: ${loadingCity.toString()},loading: ${loading.toString()},loadingMessage: ${loadingMessage.toString()},errorMessage: ${errorMessage.toString()},position: ${position.toString()},cities: ${cities.toString()}';
    return '{$string}';
  }
}
