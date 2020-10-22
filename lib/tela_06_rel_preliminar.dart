import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';
import 'classe_botao.dart';

//#########################
//TELA SEM USO - ainda
//#########################

class Tela_06_RelPreliminar extends StatefulWidget {
  @override
  _Tela_06_RelPreliminarState createState() => _Tela_06_RelPreliminarState();
}

class _Tela_06_RelPreliminarState extends State<Tela_06_RelPreliminar> {
  
 var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    ProjetoReflorestamento oProjeto = ModalRoute.of(context).settings.arguments; 
    if( oProjeto == null ){ //durante testes evita erros
    }
    
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Relatório Preliminar"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      
      floatingActionButton: BotaoFlutuante(
        hint: 'Reflorestamento', 
        acao: (){ 
          oProjeto.carregarEspecies();
          Navigator.pushNamed( context, "/tela_07", arguments: oProjeto );
        }, 
      ),

      body: Container(),
    );
  }
}
