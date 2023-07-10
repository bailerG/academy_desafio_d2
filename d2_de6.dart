import 'dart:collection';

void main() {
  final baralho = Baralho();

  baralho.inserirCarta(Carta(Naipe.Paus, 'A ♣'));
  baralho.inserirCarta(Carta(Naipe.Copas, 'A ♥'));
  baralho.inserirCarta(Carta(Naipe.Espadas, 'A ♠'));
  baralho.inserirCarta(Carta(Naipe.Ouro, 'A ♦'));

  final tamanhoBaralho = baralho.tamanhoBaralho;
  for (var i = 0; i < tamanhoBaralho; i++) {
    final cartaRemovida = baralho.removerCarta();
    print('Carta removida: ${cartaRemovida.valor}');
  }
}

class Baralho {
  final Queue<Carta> baralho = Queue<Carta>();
  int get tamanhoBaralho => baralho.length;

  void inserirCarta(Carta carta) {
    baralho.add(carta);
  }

  Carta removerCarta() {
    return baralho.removeFirst();
  }
}

enum Naipe { Paus, Espadas, Ouro, Copas }

class Carta {
  Carta(this.naipe, this.valor);
  final Naipe naipe;
  final String valor;
}
