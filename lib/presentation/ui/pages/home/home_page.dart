import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/presentation/ui/components/loader_component.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';
import 'package:weather_forecast/presentation/ui/components/no_data_component.dart';
import 'package:weather_forecast/presentation/ui/components/search_bar_component.dart';
import 'package:weather_forecast/presentation/ui/components/generic_error_component.dart';
import 'package:weather_forecast/presentation/ui/pages/home/widgets/home_page_concert_widget.dart';

class HomePage extends StatefulWidget {
  static String route = 'home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePresenter presenter = GetIt.I.get<HomePresenter>();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    presenter.getAllConcerts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeColors.redDark,
        foregroundColor: AppThemeColors.white,
        title: Text("BAND WEATHER", style: AppThemeTexts(context).subtitle(color: AppThemeColors.white)),
      ),
      body: Padding(
        padding: AppTheme.defaultScreenPadding,
        child: Observer(builder: (_) {
          return presenter.isLoading
              ? const LoaderComponent(type: ELoaderType.circularLoading, style: ELoaderComponentStyle.dark)
              : presenter.hasError
                  ? Center(
                      child: GenericErrorComponent(
                        key: const Key("home_page_error_component"),
                        errorText: presenter.errorText,
                        tryAgainFunction: () => presenter.getAllConcerts(),
                      ),
                    )
                  : Column(
                      children: [
                        SearchBarComponent(
                          searchbarController: searchController,
                          isLoading: presenter.isLoading,
                          hintText: 'Search concerts',
                          onSearchPressed: () => presenter.searchConcert(searchController.text),
                          onCleanSearchPressed: () => presenter.cleanSearch(),
                          onChanged: (String value) => presenter.onChangedSearch(value),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: presenter.concertList.isEmpty
                              ? const NoDataComponent()
                              : SingleChildScrollView(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: presenter.concertList.length,
                                    itemBuilder: (_, index) => HomePageConcertWidget(presenter, concert: presenter.concertList[index]),
                                  ),
                                ),
                        ),
                      ],
                    );
        }),
      ),
    );
  }
}
