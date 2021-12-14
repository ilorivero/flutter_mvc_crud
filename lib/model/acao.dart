class Acao {
  final String id;
  final String nome;
  final String sigla;
  final String valor;

  const Acao({
    required this.id,
    required this.nome,
    required this.sigla,
    required this.valor,
  });
}

const Dados_Iniciais = {
  "1": const Acao(id: "1", nome: "Petrobras", sigla: "PETR4", valor: "25,90"),
  "2": const Acao(id: "2", nome: "Vale do Rio Doce", sigla: "VALE3", valor: "34,55"),
  "3": const Acao(id: "3", nome: "Usiminas", sigla: "USIM5", valor: "19,21"),
};


