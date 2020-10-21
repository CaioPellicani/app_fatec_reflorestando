import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';
import 'classe_botao.dart';

class Tela_06_RelPreliminar extends StatefulWidget {
  @override
  _Tela_06_RelPreliminarState createState() => _Tela_06_RelPreliminarState();
}

class _Tela_06_RelPreliminarState extends State<Tela_06_RelPreliminar> {
  
 var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    if( oMeuReflorestamento == null ){ //durante testes evita erros
      oMeuReflorestamento = ProjetoReflorestamento();
    }
    oMeuReflorestamento.carregarEspecies();
    
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Relatório Preliminar"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: BotaoFlutuante(
        hint: 'Reflorestamento', 
        acao: ()=> Navigator.pushNamed( context, "/tela_07", arguments: oMeuReflorestamento ), 
      ),

      body: Container(),
    );
  }
}
