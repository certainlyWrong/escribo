

<div align="center">
    <img src="https://escribo.com/wp-content/uploads/2019/03/Logo-color.png" height="140em">
</div>

# Seleção de Desenvolvedor de Software - Escribo
## Teste Técnico 01
### Como foi feito?
A linguagem dart foi escolhida para escrever o programa. Para tanto, é necessário minimamente ter o interpretador dart para executar o programa, já que arquivos pré compilados não serão disponibilizados.

Inicialmente, um projeto foi criado com o comando “dart create”. Com isso, o algoritmo do teste foi organizado seguindo a estrutura padrão do projeto, onde a pasta “libs” guarda as bibliotecas criadas e a pasta “bins” fica com o executável do programa. Os testes foram criados logo após a construção do algoritmo para resolver o problema logo, os teste foram baseados nos teste propostos pelos exemplos fornecidos. Apesar disso, testes envolvendo um valor negativo e o valor zero como entrada. No caso desses dois últimos testes, a saída esperada é um 0.
 
### Como executar o programa?
Com o executável dart na máquina, execute o seguinte comando:
```dart
dart run bin/escribo.dart [valor inteiro positivo]
```
Um número inteiro positivo deve substituir a seguinte parte "[valor inteiro positivo]". Nesse caso o valor é passado como argumento para o programa.
É importante ressaltar que o comando funciona em sistemas baseados em UNIX. Não garanto que o resultado será o mesmo no Windows.


### Como executar os testes?
A execução dos testes segue a mesma lógica, mas dessa vez não é necessário a passagem de argumentos para o executável. Execute apenas o seguinte comando:
```dart
dart run test/escribo_test.dart
```