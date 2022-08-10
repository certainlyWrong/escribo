import 'package:escribo/escribo.lib.dart';
import 'package:test/test.dart';

void main() {
  test('Números négativos', () {
    expect(sumNumbers(-42), 0);
  });

  test('O valor 0 como entrada', () {
    expect(sumNumbers(0), 0);
  });

  test('O valor 10 como entrada', () {
    expect(sumNumbers(10), 23);
  });

  test('O valor 11 como entrada', () {
    expect(sumNumbers(11), 33);
  });
}
