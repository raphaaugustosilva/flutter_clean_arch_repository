import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/ui/utils/debouncer.dart';
import 'package:weather_forecast/presentation/presenters/home/mobx_home.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/weather_page.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

class HomePresenter extends MobxHome {
  final INavigation navigation;
  final IConcertGetAllUseCase concertGetAllUseCase;
  HomePresenter({required this.navigation, required this.concertGetAllUseCase});

  final _debounce = Debounce(const Duration(milliseconds: 500));
  List<ConcertModel>? _originalConcertList;

  Future<void> getAllConcerts() async {
    try {
      setIsLoading(true);
      setHasError(false);

      setConcertList(await concertGetAllUseCase.execute());
      _originalConcertList = List.from(concertList);
    } catch (_) {
      setHasError(true);
    } finally {
      setIsLoading(false);
    }
  }

  void onChangedSearch(String searchText) => _debounce.run(() => searchConcert(searchText));
  void cleanSearch() => setConcertList(_originalConcertList);

  void searchConcert(String? searchText) {
    if (isLoading) return;
    if (searchText?.isEmpty == true) return cleanSearch();

    try {
      setHasError(false);
      setConcertList(_originalConcertList?.where((e) {
        return e.city.toLowerCase().trim().contains(searchText!.toLowerCase().trim()) || e.country.toLowerCase().trim().contains(searchText.toLowerCase().trim());
      }).toList());
    } catch (_) {
      setHasError(true);
    }
  }

  navigateToWeatherDetail(ConcertModel concert) {
    navigation.navigateTo(WeatherPage.route, arguments: WeatherPageArgs(concert: concert));
  }
}
