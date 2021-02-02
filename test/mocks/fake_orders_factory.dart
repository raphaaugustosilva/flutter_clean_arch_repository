import 'package:faker/faker.dart';

class FakeOrdersFactory {
  static List<Map> makeApiJson() => [
        {
          'id': faker.guid.guid(),
          'title': faker.randomGenerator.string(20),
          'total': faker.randomGenerator.decimal(),
          'customerName': faker.person.name(),
        },
        {
          'id': faker.guid.guid(),
          'title': faker.randomGenerator.string(20),
          'total': faker.randomGenerator.decimal(),
          'customerName': faker.person.name(),
        },
        {
          'id': faker.guid.guid(),
          'title': faker.randomGenerator.string(50),
          'total': faker.randomGenerator.decimal(),
          'customerName': faker.person.name(),
        }
      ];
}
