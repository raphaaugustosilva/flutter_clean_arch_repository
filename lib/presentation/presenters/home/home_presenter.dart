import 'package:weather_forecast/presentation/presenters/home/mobx_home.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

class HomePresenter extends MobxHome {
  final IConcertGetAllUseCase concertGetAllUseCase;
  HomePresenter({required this.concertGetAllUseCase});

  Future<void> getAllConcerts() async {
    try {
      setIsLoading(true);
      setHasError(false);

      setConcertList(await concertGetAllUseCase.execute());
    } catch (_) {
      setHasError(true);
    } finally {
      setIsLoading(false);
    }
  }
}
