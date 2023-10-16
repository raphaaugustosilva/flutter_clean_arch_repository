import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/services/usecases/connection/connection_internet_check_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/connection/i_connection_internet_check_use_case.dart';

void main() {
  group("Connection Tests", () {
    test("Must return boolean according to internet connection", () async {
      // Arrange
      IConnectionInternetCheckUseCase connectionInternetCheckUseCase = ConnectionInternetCheckUseCase();

      // Action
      bool result = await connectionInternetCheckUseCase.execute();

      // Assert
      expect(result, true);
    });

    test("Must return false if there is an exception according to internet connection", () async {
      // Arrange
      IConnectionInternetCheckUseCase connectionInternetCheckUseCase = ConnectionInternetCheckUseCase();

      // Action
      bool result = await connectionInternetCheckUseCase.execute(url: "ab cd ef gh");

      // Assert
      expect(result, false);
    });
  });
}
