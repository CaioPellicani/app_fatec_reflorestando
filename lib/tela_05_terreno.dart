import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_05_Terreno extends StatefulWidget {
  @override
  _Tela_05_TerrenoState createState() => _Tela_05_TerrenoState();
}

class _Tela_05_TerrenoState extends State<Tela_05_Terreno>{

    var scaffoldKey = GlobalKey<ScaffoldState>();
    int radioGrupo;
    List<String> modeloFlorestal = [];

  @override

    void initState(){
      modeloFlorestal.add( 'P-S-C-S' );
      modeloFlorestal.add( 'P-S-P-C-P-S' );

      super.initState();
      radioGrupo = 0;
    }

  Widget build(BuildContext context) {
    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    var txtNomeProjeto = TextEditingController();
    var txtArea = TextEditingController();
    var txtDistCovas = TextEditingController();

    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Terreno e Modelo"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_07', context, oMeuReflorestamento),

      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              caixaTexto("Nome da Propriedade", txtNomeProjeto, false),
              caixaTexto("Area Total (ha)", txtArea, true),
              caixaTexto("Distância entre covas", txtDistCovas, true ),   
              RadioGroup( "Modelo Florestal", modeloFlorestal, radioGrupo),
            ],
          ),
        ),
      ),
    );
  }
}