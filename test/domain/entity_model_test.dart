// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/i_entity_model.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';

void main() {
  group("Domain Entity Model Tests", () {
    test("All the models must implement IEntityModel interface", () {
      // Arrange
      ConcertModel concertModel = ConcertModel(id: "1", date: DateTime.now(), country: "BR", city: "Americana", coordinate: (lat: 1, long: 1));
      WeatherModel weatherModel = WeatherModel(dateTime: DateTime.now(), summary: "Summary", description: "Description", icon: "icon.png", temperatureCurrent: 18, temperatureCurrentFeelsLike: 20, temperatureMin: 10, temperatureMax: 28);

      // Assert
      expect(concertModel is IEntityModel, true);
      expect(weatherModel is IEntityModel, true);
    });
  });
}
