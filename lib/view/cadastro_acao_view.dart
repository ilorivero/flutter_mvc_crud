import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/model/acao.dart';
import 'package:flutter_mvc/controller/acoes_controller.dart';
import 'package:provider/provider.dart';

class CadastroAcao extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _carregaDados(Acao acao) {
    _formData['id'] = acao.id;
    _formData['nome'] = acao.nome;
    _formData['sigla'] = acao.sigla;
    _formData['valor'] = acao.valor;
  }

  @override
  Widget build(BuildContext context) {
    final acao = ModalRoute.of(context)?.settings.arguments as Acao;

    _carregaDados(acao);

    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastre uma ação"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState?.validate();
                _form.currentState?.save();

                if (isValid != null && isValid) {
                  String? _id = _formData['id'] ?? '0';

                  Provider.of<AcoesController>(context, listen: false).put(
                    Acao(
                        id: _id,
                        nome: _formData['nome']!,
                        sigla: _formData['sigla']!,
                        valor: _formData['valor']!),
                  );
                }
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _formData['nome'],
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Ocorreu um erro';
                      },
                      onSaved: (value) => _formData['nome'] = value!,
                    ),
                    TextFormField(
                      initialValue: _formData['sigla'],
                      decoration: InputDecoration(labelText: 'Sigla'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Ocorreu um erro';
                      },
                      onSaved: (value) => _formData['sigla'] = value!,
                    ),
                    TextFormField(
                      initialValue: _formData['valor'],
                      decoration: InputDecoration(labelText: 'Valor'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Ocorreu um erro';
                      },
                      onSaved: (value) => _formData['valor'] = value!,
                    ),
                  ],
                ))));
  }
}
