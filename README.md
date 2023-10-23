# Flutter Clean Arch Repository

This project implements a clean arch repository, with an app that aims to allow a rock'n'roll band staff to track the current weather and the forecast for the 5 next days of the main cities where shows of the tour.


## Features
This project has the following features:
- Works offline (friendly error page with retry function if there is no connection);
- List and search for concerts;
- Weather information (current, minimum and maximum temperature, main weather icon and description) for the current day and the next 5 days of the selected city show;
- Loading states with animation and error state for all the screens;
- Responsive adaptive for different screen sizes.

## Technology
This project uses Flutter for app development, Firebase Crashlytics for monitoring crashes, Firebase Analytics and [OpenWeather](https://openweathermap.org) API for Weather retrieval, GetIt for dependency injection and MobX for state managment.

## Architecture
This project uses Clean Arch with SOLID design principles. The main layers of the project are: 
* **domain:** models and interfaces
* **infra:** apis, repositories
* **services:** usecases
* **presentation:** ui, components

## Environment Variables

To run this project, you will need to provide the following environment variables:

`ENVIRONMENT` => DEV ou PROD

`WEATHER_API_URL` => Weather API Url. It`s usually https://api.openweathermap.org

`WEATHER_API_KEY` => Your created Open Weather API Key


## Getting Started
To build and run this project:
1. In order to communicate with OpenWeather API, you need to create a [free account](https://home.openweathermap.org/users/sign_up) and get your [API key](https://home.openweathermap.org/api_keys).
2. Get Flutter [here](https://flutter.dev) if you don't already have it
3. Clone this repository.
4. run `cd` into the repo folder.
5. run `flutter pub get` in order to get the project dependencies
6. run `flutter pub run build_runner build --delete-conflicting-outputs` in order to generate the .g files
7. `flutter run -t lib/app/main.dart --dart-define=ENVIRONMENT=DEV --dart-define=WEATHER_API_URL=https://api.openweathermap.org --dart-define=WEATHER_API_KEY={YOUR_WEATHER_API_KEY}` to run the app

(Please note that a Mac with XCode is required to build for iOS)

## Tests

This project has unit and widget/UI tests to ensure quality and possible breaking changes when developing new codes.
To run the tests, run `flutter test` inside project's repo folder.


## Feedback

If you have any feedback, please reach out at raphaaugustosilva@gmail.com


## Contributing

You are welcome to contribute to this project! If you have an idea or a bug fix, please open an issue or a pull request.

## License

This project is licensed under the MIT License. See [LICENSE](https://choosealicense.com/licenses/mit/) for more information.


## Author

- [@raphaaugustosilva](https://www.github.com/raphaaugustosilva)


## Screenshots

<img src="https://firebasestorage.googleapis.com/v0/b/rapha-weather-forecast.appspot.com/o/screenshots%2F01.splash.PNG?alt=media&token=87c9e969-353d-4efd-8175-aa0966897e8d&_gl=1*16rs3rz*_ga*MTY5NzEwMzk2Ny4xNjk2MzgyMTM0*_ga_CW55HF8NVT*MTY5NzUwMjE5MC4xMi4xLjE2OTc1MDIzNzcuNjAuMC4w" alt="Splash Screen" width="200">  |  <img src="https://firebasestorage.googleapis.com/v0/b/rapha-weather-forecast.appspot.com/o/screenshots%2F02.home.PNG?alt=media&token=c3dcbc68-2466-4e19-b447-3a24ad6d813d&_gl=1*xp6358*_ga*MTY5NzEwMzk2Ny4xNjk2MzgyMTM0*_ga_CW55HF8NVT*MTY5NzUwMjE5MC4xMi4xLjE2OTc1MDI1OTkuNjAuMC4w" alt="Home" width="200">  |  <img src="https://firebasestorage.googleapis.com/v0/b/rapha-weather-forecast.appspot.com/o/screenshots%2F03.no_data.PNG?alt=media&token=19bfa5e2-4b80-4f86-8e2e-bc2cccf19599&_gl=1*qthimu*_ga*MTY5NzEwMzk2Ny4xNjk2MzgyMTM0*_ga_CW55HF8NVT*MTY5NzUwMjE5MC4xMi4xLjE2OTc1MDI2NDQuMTUuMC4w" alt="No Data" width="200">  |  <img src="https://firebasestorage.googleapis.com/v0/b/rapha-weather-forecast.appspot.com/o/screenshots%2F04.search.PNG?alt=media&token=1e0a191a-9b97-40b5-86a9-e5bdf66792ee&_gl=1*6gfxeg*_ga*MTY5NzEwMzk2Ny4xNjk2MzgyMTM0*_ga_CW55HF8NVT*MTY5NzUwMjE5MC4xMi4xLjE2OTc1MDI2NjQuNTguMC4w" alt="Search" width="200">  |  <img src="https://firebasestorage.googleapis.com/v0/b/rapha-weather-forecast.appspot.com/o/screenshots%2F05.loading.PNG?alt=media&token=c31ee80a-33e6-4425-b470-67e35c2b211a&_gl=1*1yozxqj*_ga*MTY5NzEwMzk2Ny4xNjk2MzgyMTM0*_ga_CW55HF8NVT*MTY5NzUwMjE5MC4xMi4xLjE2OTc1MDI2ODguMzQuMC4w" alt="Loading" width="200">  |  <img src="https://firebasestorage.googleapis.com/v0/b/rapha-weather-forecast.appspot.com/o/screenshots%2F06.weather_detail.PNG?alt=media&token=36f3dc1d-1ec0-4949-b1e5-c7da18f6250e&_gl=1*owvlr4*_ga*MTY5NzEwMzk2Ny4xNjk2MzgyMTM0*_ga_CW55HF8NVT*MTY5NzUwMjE5MC4xMi4xLjE2OTc1MDI2OTkuMjMuMC4w" alt="Weather Detail" width="200">
