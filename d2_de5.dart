import 'dart:math';

final aleatorio = Random();
void main() {
  // Instancía uma lista de compras
  ListaDeCompras lista = ListaDeCompras();
  // Adiciona o item arroz
  lista.adicionarItem(Itens("Arroz", 1));
  lista.exibirItensDesejados();
  // Marca itens como comprados
  lista.marcarComprado("Batata");
  lista.marcarComprado("Biscoito");
  // Marca um item como sem estoque
  lista.marcarIndisponivel("Queijo");
  lista.exibirItensDesejados();
}

// Cria a classe Lista de Compras
class ListaDeCompras {
  final List<Itens> listaDeItems = <Itens>[
    Itens("Queijo", 2),
    Itens("Presunto", 4),
    Itens("Batata", 20),
    Itens("Maçã", 15),
    Itens("Biscoito", 3),
  ];
  final List<Itens> listaComprados = <Itens>[];
  final List<Itens> listaSemEstoque = <Itens>[];
  final List<Itens> listaDesejados = <Itens>[];

  // Separa os itens nas suas respectivas listas de acordo com seu status
  void separarItems() {
    listaDeItems.forEach((item) {
      if (!listaComprados.contains(item) &&
          item.status == statusItens.comprado) {
        listaComprados.add(item);
      }
      if (!listaSemEstoque.contains(item) &&
          item.status == statusItens.semEstoque) {
        listaSemEstoque.add(item);
        // Se o item estiver sem estoque, é automaticamente removido da lista de compras
        listaDesejados.remove(item);
      }
      if (!listaDesejados.contains(item) &&
          item.status == statusItens.desejado) {
        listaDesejados.add(item);
      }
    });
  }

  // Exibe os itens da lista e o progresso
  void exibirItensDesejados() {
    print("-----------------------------------------------\n");
    print("Estes são os itens desejados:\n");
    listaDesejados.forEach((item) {
      print(item);
    });
    print("\nProgresso: ${listaComprados.length}/${listaDesejados.length}");
    print("\n-----------------------------------------------");
  }

  // Adiciona novos itens a lista de compras
  void adicionarItem(Itens item) {
    listaDeItems.add(item);
    separarItems();
  }

  // Marca um item como comprado
  void marcarComprado(String nome) {
    listaDeItems.forEach((item) {
      if (item.nome.toLowerCase() == nome.toLowerCase()) {
        item.mudaStatus("comprado");
      }
    });
    separarItems();
  }

  // Marca um item como indisponivel
  void marcarIndisponivel(String nome) {
    listaDeItems.forEach((item) {
      if (item.nome.toLowerCase() == nome.toLowerCase()) {
        item.mudaStatus("sem estoque");
      }
    });
    separarItems();
  }
}

// Cria os status dos itens
enum statusItens { desejado, comprado, semEstoque }

// Cria o objeto Item
class Itens {
  Itens(this.nome, this.quantidade);
  final String nome;
  final int quantidade;
  statusItens status = statusItens.desejado;

  // Muda o status do respectivo item
  void mudaStatus(String novoStatus) {
    novoStatus = novoStatus.toLowerCase();
    switch (novoStatus) {
      case == "comprado":
        status = statusItens.comprado;
      case == "sem estoque":
        status = statusItens.semEstoque;
      default:
        status = statusItens.desejado;
    }
  }

  // Representa o item como uma string
  @override
  String toString() {
    return "----- Item: $nome // Quantidade: $quantidade // Status: ${status.name.toUpperCase()} -----";
  }
}
