import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_transparency_use_case.dart';
import 'package:weather_forecast/services/usecases/initial_app_core_services/exceptions/initial_app_core_services_exceptions.dart';

class InitialAppTransparencyUseCase implements IInitialAppTransparencyUseCase {
  @override
  Future<void> execute() async {
    try {
      // Show tracking authorization dialog and ask for permission
      await AppTrackingTransparency.requestTrackingAuthorization();
    } catch (e) {
      throw InitialAppCoreServicesExceptions(innerException: e, message: "Error at init app transparency service use case");
    }
  }
}
