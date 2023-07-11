import 'dart:math';

void main() {
  final album = Album();
  final pacoteDeFiguras = PacoteDeFiguras();

  // Realiza um loop para abrir pacotes até que o album esteja completo
  while (!album.albumCompleto()) {
    List<Figurinha> pacoteAberto = pacoteDeFiguras.abrirPacote();
    // Adiciona as figurinhas no album
    pacoteAberto.forEach((figurinha) {
      album.adicionarFigurinha(figurinha);
    });
  }

  album.imprimirAlbum();
  // Imprima o número de figuras repetidas
  // e chame o método para imprimir o álbum
}

final Random random = Random();
final Map<int, Figurinha> colecao = {
  1: Figurinha("Figurinha 01"),
  2: Figurinha("Figurinha 02"),
  3: Figurinha("Figurinha 03"),
  4: Figurinha("Figurinha 04"),
  5: Figurinha("Figurinha 05"),
  6: Figurinha("Figurinha 06"),
  7: Figurinha("Figurinha 07"),
  8: Figurinha("Figurinha 08"),
  9: Figurinha("Figurinha 09"),
  10: Figurinha("Figurinha 10"),
  11: Figurinha("Figurinha 11"),
  12: Figurinha("Figurinha 12"),
  13: Figurinha("Figurinha 13"),
  14: Figurinha("Figurinha 14"),
  15: Figurinha("Figurinha 15"),
  16: Figurinha("Figurinha 16"),
  17: Figurinha("Figurinha 17"),
  18: Figurinha("Figurinha 18"),
  19: Figurinha("Figurinha 19"),
  20: Figurinha("Figurinha 20")
};

class Figurinha {
  final String nome;

  Figurinha(this.nome);

  @override
  String toString() {
    return nome;
  }
}

class PacoteDeFiguras {
  List<Figurinha> abrirPacote() {
    final List<Figurinha> figurasPacote = [];
    while (figurasPacote.length < 4) {
      final figuraAleatoria = colecao[random.nextInt(colecao.length) + 1]!;
      if (!figurasPacote.contains(figuraAleatoria)) {
        figurasPacote.add(figuraAleatoria);
      }
    }
    return figurasPacote;
  }
}

class Album {
  final Map<int, Figurinha> figurasAlbum = {};
  final Map<int, Figurinha> figurasRepetidas = {};

  void adicionarFigurinha(Figurinha figurinha) {
    !figurasAlbum.containsValue(figurinha)
        ? figurasAlbum[figurasAlbum.length + 1] = figurinha
        : figurasRepetidas[figurasRepetidas.length + 1] = figurinha;
  }

  void imprimirAlbum() {
    print("Quantidade de figuras repetidas: ${figurasRepetidas.length}\n");
    for (var i = 1; i <= figurasAlbum.length; i++) {
      final figurinha = figurasAlbum[i];
      late int codigo;
      colecao.forEach((key, value) {
        if (value == figurinha) {
          codigo = key;
        }
      });
      print("$codigo: $figurinha \n");
    }
  }

  bool albumCompleto() {
    return figurasAlbum.length == colecao.length;
  }
}
