/// Retorna a soma dos números entre [number] e [0],
/// caso [number] seja negativo, retorna [0]
int sumNumbers(int number) {
  int sumResult = 0;
  for (int i = 0; i < number; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sumResult += i;
    }
  }

  return sumResult;
}
