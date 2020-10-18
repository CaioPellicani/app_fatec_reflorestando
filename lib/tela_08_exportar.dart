import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_08_Exportar extends StatefulWidget {
  @override
  _Tela_08_ExportarState createState() => _Tela_08_ExportarState();
}

class _Tela_08_ExportarState extends State<Tela_08_Exportar>{

   var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Exportar Lista de Espécies"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      //floatingActionButton: botaoProximo( '/tela_07', context, oMeuReflorestamento),

      body: Container(),
    );
  }
}