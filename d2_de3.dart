void main() {
  BibliotecaDeMusicas().imprimeBiblioteca();
}

// Cria uma classe para estruturar o objeto Musica
class Musica {
  Musica(this.titulo, this.artista, this.album, this.duracao);
  final String titulo;
  final String artista;
  final String album;
  final int duracao;

// Cria uma string para todas as musicas
  @override
  String toString() {
    String stringMusica =
        "--- Nome: $titulo // Autor: $artista // Album: $album // Duração: $duracao segundos ---\n";
    return stringMusica;
  }
}

// Cria uma biblioteca de musicas com uma lista de várias musicas
class BibliotecaDeMusicas {
  final List<Musica> listaDeMusicas = [
    Musica("VICTORIA PARK", "cleopatrick", "BUMMER", 179),
    Musica("Sprinter", "Central Cee", "Sprinter", 229),
    Musica("Run Through The Jungle", "Creedence Clearwater Revival",
        "Cosmo's Factory", 185),
    Musica("Bleed", "Meshuggah", "ObZen", 442),
  ];

  // Calcula o tempo total e converte em horas
  double tempoTotal() {
    int soma = 0;
    listaDeMusicas.forEach((musica) {
      soma += musica.duracao;
    });
    double totalEmHoras = (soma / 60) / 60;
    return totalEmHoras;
  }

  // Permite adicionar novas musicas
  void addMusica(Musica musica) {
    listaDeMusicas.add(musica);
  }

  // Imprime todas as musicas, a quantidade de musicas na biblioteca e o tempo total em horas
  void imprimeBiblioteca() {
    listaDeMusicas.forEach((musica) {
      print(musica);
    });
    print("Nº total de musicas na biblioteca: ${listaDeMusicas.length}");
    print("Tempo total: ${tempoTotal().toStringAsFixed(2)} horas");
  }
}
