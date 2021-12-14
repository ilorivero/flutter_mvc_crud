import 'package:flutter/material.dart';
import 'package:flutter_mvc/view/acoes_tile.dart';
import 'package:flutter_mvc/controller/acoes_controller.dart';
import 'package:flutter_mvc/controller/app_routes.dart';
import 'package:provider/provider.dart';

class ListaAcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AcoesController acoes = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Ações"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CADASTRO);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
          itemCount: acoes.count,
          itemBuilder: (ctx, i) => AcoesTile(acoes.byIndex(i)),
        ));
  }
}
