import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'main.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_04_bioma extends StatefulWidget {
  @override
  _Tela_04_biomaState createState() => _Tela_04_biomaState();
}

class _Tela_04_biomaState extends State<Tela_04_bioma>{

  ProjetoReflorestamento o_MeuReflorestamento = ProjetoReflorestamento();

  List<String> biomas = [];
  List<String> apps = [];

  String txtBioma;
  String txtApp;

  @override
  void initState(){
    biomas.add( "Amazônia" );
    biomas.add( "Cerrado" );
    biomas.add( "Pantanal" );
    biomas.add( "Mata Atlântica");

    apps.add( "Margem de Rio" );
    apps.add( "Nascente" );
    apps.add( "Topo de Morro" );
    apps.add( "Não Especifico" );

    super.initState();
    txtBioma = biomas[0];
    txtApp = apps[0];
  }

  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: barraPadrao("Bioma e Terreno"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,

      body: Container(  
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //padding: EdgeInsets.all( 10 ),
            //shrinkWrap: true,
            children: [
              SizedBox( height: 20 ),
              DropBox("Biomas", txtBioma, biomas),
              SizedBox( height: 60 ),
              DropBox("Tipo", txtApp, apps ),
              SizedBox( height: 60 ),
            ],
          ),
        ),
      ),  
    );
  }
}

