// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/infra/exceptions/infra_exceptions.dart';

void main() {
  group("Infra Exceptions Tests", () {
    test("Ensure that Infra Exceptions are InfraException Base", () {
      // Arrange
      InfraException infraException = InfraException();
      InfraNotAuthorizedException infraNotAuthorizedException = InfraNotAuthorizedException();
      InfraNotFoundException infraNotFoundException = InfraNotFoundException();

      // Assert
      expect(infraException is Exception, true);
      expect(infraNotAuthorizedException is InfraException, true);
      expect(infraNotAuthorizedException is Exception, true);
      expect(infraNotFoundException is InfraException, true);
      expect(infraNotFoundException is Exception, true);
    });
  });
}
