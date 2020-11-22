import 'package:flutter/material.dart';
import 'main.dart';
import 'meus_widgets.dart';
import 'classe_botao.dart';
import 'model/classe_projeto.dart';

class Tela_08_Exportar extends StatefulWidget {
  @override
  _Tela_08_ExportarState createState() => _Tela_08_ExportarState();
}

class _Tela_08_ExportarState extends State<Tela_08_Exportar>{

   var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ProjetoReflorestamento oProjeto = ModalRoute.of(context).settings.arguments; 
    if( oProjeto == null ){ //durante testes evita erros
      oProjeto = ProjetoReflorestamento();
    }
 
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
              Botao( label:"Email", acao:null),
              Botao( label: "WhatApp", acao: null),
              Botao( label:"Telegram", acao: null),
            ],
          ),
        )
      ),
    );
  }
}