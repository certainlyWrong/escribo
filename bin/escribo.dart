import 'package:escribo/escribo.lib.dart' as escribo;

void main(List<String> arguments) {
  // Caso o número tenha sido passado como argumento
  if (arguments.isNotEmpty) {
    try {
      int number = int.parse(arguments[0]);
      print('resultado: ${escribo.sumNumbers(number)}');
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  } else {
    print('Por favor, passe um número como argumento.');
  }
}
