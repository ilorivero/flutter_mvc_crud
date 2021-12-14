import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/model/acao.dart';
import 'package:flutter_mvc/controller/acoes_controller.dart';
import 'package:flutter_mvc/controller/app_routes.dart';
import 'package:provider/provider.dart';

class AcoesTile extends StatelessWidget {
  final Acao acao;

  const AcoesTile(this.acao);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(acao.sigla),
        ],
      ),
      title: Text(acao.nome),
      subtitle: Text(acao.valor),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(
            AppRoutes.CADASTRO,
            arguments: acao,
            );
          }, icon: Icon(Icons.edit),
          color: Colors.green,),
          IconButton(onPressed: (){

            showDialog(context: context, builder: (ctx) => AlertDialog(
              title: Text('Excluir Ação'),
              content: Text('Confirma a exclusão?'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: (){

                    Provider.of<AcoesController>(context, listen:false).remove(acao);
                    Navigator.of(context).pop();

                  },
                  child: Text("Sim"),

                ),
                ElevatedButton(
                  onPressed: (){

                    Navigator.of(context).pop();

                  },
                  child:Text("Não"),

                ),
              ],

            ));


          }, icon: Icon(Icons.delete),
          color: Colors.red),
        ],),
      ),
    );
  }
}
