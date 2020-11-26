import 'package:flutter/material.dart';
import 'main.dart';
import 'meus_widgets.dart';
import 'classe_botao.dart';
import 'model/classe_projeto.dart';

class Tela_03_Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Menu de Opções"),
        centerTitle: true,
        leading: Container()
      ),

      body: Container(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all( valorPadding ),
            shrinkWrap: true,
            children: [
              Botao(label: 'Reflorestamento', 
                acao: (){
                  ProjetoReflorestamento oProjeto = ProjetoReflorestamento();
                  Navigator.pushNamed( context, "/tela_04", arguments: oProjeto );
                },
              ),
              Botao(label: 'Agrofloresta', acao: null ),
              Botao(label: 'Silvopastoril',acao: null ),
              Botao(label: 'Arboriazação Urbana', acao: null,),
              Botao(label: 'Sobre o Desenvolvedor', acao: ()=> Navigator.pushNamed( context, "/tela_02" ) ),
            ],
          ),
        ),
      )
    );   
  }
}
