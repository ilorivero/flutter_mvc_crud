import 'package:flutter/material.dart';
import 'package:flutter_mvc/controller/acoes_controller.dart';
import 'package:flutter_mvc/controller/app_routes.dart';
import 'package:flutter_mvc/view/cadastro_acao_view.dart';
import 'package:flutter_mvc/view/lista_acoes_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => AcoesController(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CRUD com Flutter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              AppRoutes.HOME: (_) => ListaAcoes(),
              AppRoutes.CADASTRO: (_) => CadastroAcao()
            }));
  }
}
