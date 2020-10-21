import 'package:flutter/material.dart';
import 'main.dart';
import 'meus_widgets.dart';
import 'classe_botao.dart';

class Tela_03_Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: barraPadrao("Menu de Opções"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,

      body: Container(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all( valorPadding ),
            shrinkWrap: true,
            children: [
              Botao(label: 'Reflorestamento', acao: ()=> Navigator.pushNamed( context, "/tela_04" ) ),
              Botao(label: 'Agrofloresta', acao: null ),
              Botao(label: 'Silvopastoril',acao: null ),
              Botao(label: 'Arboriazação Urbana', acao: null,),
            ],
          ),
        ),
      )
    );   
  }
}
