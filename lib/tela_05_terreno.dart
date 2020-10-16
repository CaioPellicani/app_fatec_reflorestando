import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
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
      modeloFlorestal.add( 'teste1' );
      modeloFlorestal.add( 'teste2' );
      modeloFlorestal.add( 'teste3' );

      super.initState();
      radioGrupo = 0;
    }

  Widget build(BuildContext context) {
    var oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    double txtArea;

    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Terreno e Modelo"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_05', context, oMeuReflorestamento),

      body: Column(
        children: [
          caixaTexto("Area Total (ha)", txtArea),
          RadioGroup( "Modelo Florestal", modeloFlorestal)
        ],
      ),
    );
  }
}
