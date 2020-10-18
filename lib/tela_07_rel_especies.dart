import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_07_RelEspecies extends StatefulWidget {
  @override
  _Tela_07_RelEspeciesState createState() => _Tela_07_RelEspeciesState();
}

class _Tela_07_RelEspeciesState extends State<Tela_07_RelEspecies>{
 var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Lista de Espécies"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_08', context, oMeuReflorestamento),

      body: Container(),
    );
  }
}