import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/model/acao.dart';

class AcoesController with ChangeNotifier {
  final Map<String, Acao> _acao = {...Dados_Iniciais};

  List<Acao> get all {
    return [..._acao.values];
  }

  int get count {
    return _acao.length;
  }

  Acao byIndex(int i) {
    return _acao.values.elementAt(i);
  }

  void put(Acao acao) {
    if (acao == null) {
      return;
    }
    if (acao.id != '0' &&
        acao.id.trim().isNotEmpty &&
        _acao.containsKey(acao.id)) {
      _acao.update(
          acao.id,
          (_) => Acao(
              id: acao.id,
              nome: acao.nome,
              sigla: acao.sigla,
              valor: acao.valor));
    } else {
      final id = Random().nextDouble.toString();
      _acao.putIfAbsent(
          id,
          () => Acao(
              id: id, nome: acao.nome, sigla: acao.sigla, valor: acao.valor));
    }
    notifyListeners();
  }

  void remove(Acao acao) {
    if (acao != null && acao.id != null) {
      _acao.remove(acao.id);
      notifyListeners();
    }
  }
}
