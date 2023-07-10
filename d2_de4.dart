import 'dart:math' as math;

void main() {
  final formas = [
    Circulo('Círculo A', 3),
    Circulo('Círculo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    TrianguloEquilatero('Triângulo Equilátero A', 5),
    TrianguloEquilatero('Triângulo Equilátero B', 7),
    TrianguloRetangulo('Triângulo Retângulo A', 3, 4),
    TrianguloRetangulo('Triângulo Retângulo B', 5, 12),
    PentagonoRegular('Pentágono Regular A', 6),
    PentagonoRegular('Pentágono Regular B', 8),
    HexagonoRegular('Hexágono Regular A', 4),
    HexagonoRegular('Hexágono Regular B', 7),
  ];

  // Calcula qual a maior area e perimetro e guarda nas respectivas variaveis
  final maiorArea = compararFormas(formas, (forma) => forma.calcularMedida());
  final maiorPerimetro =
      compararFormas(formas, (forma) => forma.calcularMedida());

  print(
      'A maior área é ${maiorArea.calcularMedida().toStringAsFixed(2)} e pertence a ${maiorArea.nome}');
  print(
      'O maior perímetro é ${maiorPerimetro.calcularMedida().toStringAsFixed(2)} e pertence a ${maiorPerimetro.nome}');
}

// Cria uma classe abstrata com as caracteristicas da forma
abstract class Forma {
  Forma(this.nome);

  final String nome;

  double calcularMedida();
}

// Cria o objeto circulo
class Circulo extends Forma {
  Circulo(String nome, this.raio) : super(nome);

  final double raio;

  @override
  double calcularMedida() => raio;
}

// Cria o objeto retangulo
class Retangulo extends Forma {
  Retangulo(String nome, this.altura, this.largura) : super(nome);

  final double altura;
  final double largura;

  @override
  double calcularMedida() => altura * largura;
}

// Cria o objeto Triangulo Equilatero
class TrianguloEquilatero extends Forma {
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  final double lado;
  @override
  double calcularMedida() => (math.sqrt(3) / 4) * math.pow(lado, 2);
}

// Cria o objeto Triangulo Retangulo
class TrianguloRetangulo extends Forma {
  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  final double base;
  final double altura;

  @override
  double calcularMedida() =>
      base + altura + math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
}

// Cria o objeto Pentagono Regular
class PentagonoRegular extends Forma {
  PentagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularMedida() => (5 * lado * lado) / (4 * math.tan(math.pi / 5));
}

// Cria o objeto Hexagono Regular
class HexagonoRegular extends Forma {
  HexagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularMedida() => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;
}

// Compara as formas e retorna a maior
Forma compararFormas(List<Forma> formas, double Function(Forma) medida) {
  return formas.reduce(
      (atual, proximo) => medida(proximo) > medida(atual) ? proximo : atual);
}
