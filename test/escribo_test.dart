import 'package:escribo/escribo.lib.dart';
import 'package:test/test.dart';

void main() {
  test('Números négativos', () {
    expect(calculate(-42), 0);
  });

  test('O valor 0 como entrada', () {
    expect(calculate(0), 0);
  });

  test('O valor 10 como entrada', () {
    expect(calculate(10), 23);
  });

  test('O valor 11 como entrada', () {
    expect(calculate(11), 33);
  });
}
