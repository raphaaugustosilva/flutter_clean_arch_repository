import 'dart:io';

String fixtureInfra(String name) => File('test/infra/weather_api/mocks/$name').readAsStringSync();
