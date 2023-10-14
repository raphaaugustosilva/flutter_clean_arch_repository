import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/utils/extensions/iterable_extension.dart';

void main() {
  group("Iterable Extension Tests", () {
    List<String>? listEmpty;
    late List<String>? listWithOneElement;
    late List<String>? listWithManyElements;
    setUp(() {
      listWithOneElement = ["First Element"];
      listWithManyElements = ["First Element =D", "Second Element =D"];
    });

    test("Must result null when there is no element at list", () {
      // Action
      var result = listEmpty?.firstOrNull; // ignore: dead_code

      // Assert
      expect(result, null);
    });

    test("Must result the first element of list", () {
      // Action
      var result = listWithOneElement?.firstOrNull;

      // Assert
      expect(result, "First Element");

      // Action
      result = listWithManyElements?.firstOrNull;

      // Assert
      expect(result, "First Element =D");
    });

    test("Must result null when there is no element after filter (where) at list", () {
      // Action
      var result = listWithOneElement?.firstWhereOrNull((element) => element == "not found element here");

      // Assert
      expect(result, null);

      // Action
      result = listWithManyElements?.firstWhereOrNull((element) => element == "not found element here");

      // Assert
      expect(result, null);
    });

    test("Must result the first element after filter (where) of a not null and more than one item list", () {
      // Action
      var result = listWithOneElement?.firstWhereOrNull((element) => element == "First Element");

      // Assert
      expect(result, "First Element");

      // Action
      result = listWithManyElements?.firstWhereOrNull((element) => element == "Second Element =D");

      // Assert
      expect(result, "Second Element =D");
    });

    test("Must result the elements grouped by date", () {
      // Arrange
      List<_TestClass> testClassList = [
        _TestClass(DateTime(2023, 10, 14), "Hi 14/10/2023"),
        _TestClass(DateTime(2023, 10, 14), "How are you 14/10/2023?"),
        _TestClass(DateTime(2023, 10, 20), "Hi 20/10/2023"),
        _TestClass(DateTime(2023, 10, 20), "Great day !!"),
        _TestClass(DateTime(2023, 10, 20), "Let's code?"),
        _TestClass(DateTime(2023, 10, 22), "This element is 22/10/2023"),
        _TestClass(DateTime(2023, 10, 28), "Hello 28/10/2023"),
        _TestClass(DateTime(2023, 10, 28), "Do you like testing?"),
        _TestClass(DateTime(2023, 10, 28), "Let's test some code!"),
        _TestClass(DateTime(2023, 10, 28), "Hello"),
        _TestClass(DateTime(2023, 10, 28), "Bye"),
      ];

      // Action
      var result = testClassList.groupBy((element) => element.date);

      // Assert
      expect(result.length, 4);
      expect(result[DateTime(2023, 10, 14)]!.length, 2);
      expect(result[DateTime(2023, 10, 14)]![0].value, "Hi 14/10/2023");
      expect(result[DateTime(2023, 10, 14)]![1].value, "How are you 14/10/2023?");

      expect(result[DateTime(2023, 10, 20)]!.length, 3);
      expect(result[DateTime(2023, 10, 20)]![0].value, "Hi 20/10/2023");
      expect(result[DateTime(2023, 10, 20)]![1].value, "Great day !!");
      expect(result[DateTime(2023, 10, 20)]![2].value, "Let's code?");

      expect(result[DateTime(2023, 10, 22)]!.length, 1);
      expect(result[DateTime(2023, 10, 22)]![0].value, "This element is 22/10/2023");

      expect(result[DateTime(2023, 10, 28)]!.length, 5);
      expect(result[DateTime(2023, 10, 28)]![0].value, "Hello 28/10/2023");
      expect(result[DateTime(2023, 10, 28)]![1].value, "Do you like testing?");
      expect(result[DateTime(2023, 10, 28)]![2].value, "Let's test some code!");
      expect(result[DateTime(2023, 10, 28)]![3].value, "Hello");
      expect(result[DateTime(2023, 10, 28)]![4].value, "Bye");
    });
  });
}

class _TestClass {
  final DateTime date;
  final String value;

  const _TestClass(this.date, this.value);
}
