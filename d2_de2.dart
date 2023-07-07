import 'dart:math';

enum StatusCaloria { DeficitExtremo, Deficit, Satisfeito, Excesso }

final random = Random();
void main() {
  final pessoa = Pessoa();

  // Mostra com quantas calorias a pessoa já iniciou
  print("Calorias iniciais: ${pessoa._caloriasConsumidas}");
  int numeroRefeicoes = 0;

  // Faz uma lista de todos os fornecedores para que seja possivel escolhe-los aleatoriamente
  final fornecedores = <Fornecedor>[
    FornecedorComidas(),
    FornecedorDeBebidas(),
    FornecedorDoces(),
    FornecedorUltraCaloricos(),
  ];

  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    if (pessoa._caloriasConsumidas >= 2500) {
      break;
    }
    // Conta o numero de refeições feitas
    numeroRefeicoes++;

    // Escolhe um fornecedor aleatório para cada refeicao
    pessoa.refeicao(fornecedores[random.nextInt(fornecedores.length)]);
  }

  // Imprime as informações dessa pessoa
  pessoa.informacoes(numeroRefeicoes);
}

class Pessoa {
  // Acumulador de calorias
  int _caloriasConsumidas = random.nextInt(1700) + 300;
  late String _statusCaloria;

  /// Imprime as informacoes desse consumidor
  void informacoes(int numeroRefeicoes) {
    print('Calorias consumidas: $_caloriasConsumidas');
    print('Status: $_statusCaloria');
    print("Numero de refeições: $numeroRefeicoes");
  }

  /// Consome um produto e soma o numero de calorias
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    atualizarStatusCaloria();
  }

  // Atualiza o status de calorias dessa pessoa (Ex: Deficit calórico)
  void atualizarStatusCaloria() {
    switch (_caloriasConsumidas) {
      case <= 500:
        _statusCaloria = StatusCaloria.DeficitExtremo.name;
      case > 500 && <= 1800:
        _statusCaloria = StatusCaloria.Deficit.name;
      case > 1800 && <= 2500:
        _statusCaloria = StatusCaloria.Satisfeito.name;
      case > 2500:
        _statusCaloria = StatusCaloria.Excesso.name;
      default:
        _statusCaloria = StatusCaloria.Satisfeito.name;
    }
  }
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

// Uma classe abstrata de Fornecedor para que seja possivel criar vários fornecedores
abstract class Fornecedor {
  final _random = Random();
  // Lista de produtos
  final _produtosDisponiveis = <Produto>[];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _produtosDisponiveis[_random.nextInt(_produtosDisponiveis.length)];
  }
}

class FornecedorComidas extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Churrasco', 570),
    Produto('Batata-Frita', 490),
    Produto('Hamburguer', 700),
    Produto('Arroz e Feijão', 640),
    Produto('Salada', 120),
  ];
}

class FornecedorDoces extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Bolo', 380),
    Produto('Sorvete', 600),
    Produto('Torta', 360),
    Produto('Chocolate', 300),
    Produto('Bom-Bom', 150),
  ];
}

class FornecedorUltraCaloricos extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Salgadinho', 730),
    Produto('Castanhas', 600),
    Produto('Queijo', 560),
    Produto('Iogurte', 630),
    Produto('Milk Shake', 1350),
  ];
}

class FornecedorDeBebidas extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];
}
