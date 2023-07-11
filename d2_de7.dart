import 'dart:collection';
import 'dart:math';

final aleatorio = Random();
void main() {
  FilaSupermercado fila = FilaSupermercado();
  print("================================");
  for (var i = 0; i < 10; i++) {
    Pessoa pessoa = Pessoa();
    fila.adicionarAFila(pessoa);
  }
  print("================================");
  for (var j = 0; j < 10; j++) {
    fila.atenderPessoa();
  }
  print("================================");
}

class Pessoa {
  final nome = [
    'Ana',
    'Maria',
    'Francisco',
    'Joao',
    'Pedro',
    'Gabriel',
    'Rafaela',
    'Marcio',
    'Jose',
    'Carlos',
    'Patricia',
    'Helena',
    'Camila',
    'Mateus',
    'Gabriel',
    'Samuel',
    'Karina',
    'Antonio',
    'Daniel',
    'Joel',
    'Cristiana',
    'Sebastiao',
    'Paula'
  ];
  final sobrenome = [
    'Silva',
    'Souza',
    'Almeida',
    'Azevedo',
    'Braga',
    'Barros',
    'Campos',
    'Cardoso',
    'Costa',
    'Teixeira',
    'Santos',
    'Rodrigues',
    'Ferreira',
    'Alves',
    'Pereira',
    'Lima',
    'Gomes',
    'Ribeiro',
    'Carvalho',
    'Lopes',
    'Barbosa'
  ];

  late final nomeCompleto = gerarNomeAleatorio();

  String gerarNomeAleatorio() {
    return "${nome[aleatorio.nextInt(nome.length)]} ${sobrenome[aleatorio.nextInt(sobrenome.length)]}";
  }

  @override
  String toString() {
    return "$nomeCompleto";
  }
}

class FilaSupermercado {
  Queue<Pessoa> filaDoSupermercado = Queue<Pessoa>();

  void adicionarAFila(Pessoa pessoa) {
    filaDoSupermercado.add(pessoa);
    print("$pessoa entrou na fila.");
  }

  void atenderPessoa() {
    final pessoaAtendida = filaDoSupermercado.removeFirst();
    print("$pessoaAtendida foi atendido(a).");
  }
}
