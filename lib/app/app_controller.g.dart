// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$currentCoordinateAtom =
      Atom(name: '_AppControllerBase.currentCoordinate');

  @override
  Coordinate get currentCoordinate {
    _$currentCoordinateAtom.context.enforceReadPolicy(_$currentCoordinateAtom);
    _$currentCoordinateAtom.reportObserved();
    return super.currentCoordinate;
  }

  @override
  set currentCoordinate(Coordinate value) {
    _$currentCoordinateAtom.context.conditionallyRunInAction(() {
      super.currentCoordinate = value;
      _$currentCoordinateAtom.reportChanged();
    }, _$currentCoordinateAtom, name: '${_$currentCoordinateAtom.name}_set');
  }

  final _$localesAtom = Atom(name: '_AppControllerBase.locales');

  @override
  List<Locale> get locales {
    _$localesAtom.context.enforceReadPolicy(_$localesAtom);
    _$localesAtom.reportObserved();
    return super.locales;
  }

  @override
  set locales(List<Locale> value) {
    _$localesAtom.context.conditionallyRunInAction(() {
      super.locales = value;
      _$localesAtom.reportChanged();
    }, _$localesAtom, name: '${_$localesAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_AppControllerBase.state');

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

  final _$cityAtom = Atom(name: '_AppControllerBase.city');

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

  final _$searchCoordinatesAsyncAction = AsyncAction('searchCoordinates');

  @override
  Future<void> searchCoordinates(
      {@required double latitude, @required double longitude}) {
    return _$searchCoordinatesAsyncAction.run(() =>
        super.searchCoordinates(latitude: latitude, longitude: longitude));
  }

  final _$searchCityAsyncAction = AsyncAction('searchCity');

  @override
  Future<void> searchCity({@required String state, @required String city}) {
    return _$searchCityAsyncAction
        .run(() => super.searchCity(state: state, city: city));
  }

  final _$loadFromDiskAsyncAction = AsyncAction('loadFromDisk');

  @override
  Future<void> loadFromDisk() {
    return _$loadFromDiskAsyncAction.run(() => super.loadFromDisk());
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  String getTitle() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.getTitle();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentCoordinate: ${currentCoordinate.toString()},locales: ${locales.toString()},state: ${state.toString()},city: ${city.toString()}';
    return '{$string}';
  }
}
