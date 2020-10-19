import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_06_RelPreliminar extends StatefulWidget {
  @override
  _Tela_06_RelPreliminarState createState() => _Tela_06_RelPreliminarState();
}

class _Tela_06_RelPreliminarState extends State<Tela_06_RelPreliminar> {
  
 var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Relatório Preliminar"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_07', context, oMeuReflorestamento),

      body: Container(),
    );
  }
}
