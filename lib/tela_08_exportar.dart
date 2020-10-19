import 'package:flutter/material.dart';
import 'main.dart';
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
    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Exportar Lista de Espécies em PDF"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,

      body: Container(
        padding: EdgeInsets.all(valorPadding),
        child: Center(
          child: ListView( 
            shrinkWrap: true,
            children: [
              botaoSimples("Email", "", context, false),
              botaoSimples("WhatApp", "", context, false),
              botaoSimples("Telegram", "", context, false),
            ],
          ),
        )
      ),
    );
  }
}