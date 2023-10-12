import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/presentation/ui/components/loader_component.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';
import 'package:weather_forecast/presentation/ui/components/generic_error_component.dart';

class HomePage extends StatefulWidget {
  static String route = 'home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePresenter presenter = GetIt.I.get<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BAND WEATHER"),
      ),
      body: Observer(builder: (_) {
        return presenter.isLoading
            ? const LoaderComponent(style: ELoaderComponentStyle.dark)
            : presenter.hasError
                ? Center(
                    child: GenericErrorComponent(
                      errorText: presenter.errorText,
                      tryAgainFunction: () => presenter.getAllConcerts(),
                    ),
                  )
                : Column(
                    children: [
                      ElevatedButton(onPressed: () => presenter.getAllConcerts(), child: const Text("TESTE recuperar shows")),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: AppTheme.defaultScreenPadding,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: presenter.concertList.length,
                                  itemBuilder: (_, index) => ListTile(
                                    title: Text(presenter.concertList[index].city),
                                    subtitle: Text(presenter.concertList[index].country),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
      }),
    );
  }
}
