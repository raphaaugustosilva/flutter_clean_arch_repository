// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_weather.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxWeather on MobxWeatherBase, Store {
  late final _$weatherCurrentAtom =
      Atom(name: 'MobxWeatherBase.weatherCurrent', context: context);

  @override
  WeatherModel? get weatherCurrent {
    _$weatherCurrentAtom.reportRead();
    return super.weatherCurrent;
  }

  @override
  set weatherCurrent(WeatherModel? value) {
    _$weatherCurrentAtom.reportWrite(value, super.weatherCurrent, () {
      super.weatherCurrent = value;
    });
  }

  late final _$weatherForecastListAtom =
      Atom(name: 'MobxWeatherBase.weatherForecastList', context: context);

  @override
  ObservableList<WeatherModel> get weatherForecastList {
    _$weatherForecastListAtom.reportRead();
    return super.weatherForecastList;
  }

  @override
  set weatherForecastList(ObservableList<WeatherModel> value) {
    _$weatherForecastListAtom.reportWrite(value, super.weatherForecastList, () {
      super.weatherForecastList = value;
    });
  }

  late final _$MobxWeatherBaseActionController =
      ActionController(name: 'MobxWeatherBase', context: context);

  @override
  dynamic setWeatherCurrent(WeatherModel? value) {
    final _$actionInfo = _$MobxWeatherBaseActionController.startAction(
        name: 'MobxWeatherBase.setWeatherCurrent');
    try {
      return super.setWeatherCurrent(value);
    } finally {
      _$MobxWeatherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWeatherForecastList(List<WeatherModel>? list) {
    final _$actionInfo = _$MobxWeatherBaseActionController.startAction(
        name: 'MobxWeatherBase.setWeatherForecastList');
    try {
      return super.setWeatherForecastList(list);
    } finally {
      _$MobxWeatherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weatherCurrent: ${weatherCurrent},
weatherForecastList: ${weatherForecastList}
    ''';
  }
}
