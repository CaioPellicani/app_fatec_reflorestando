import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'main.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_04_Bioma extends StatefulWidget {
  @override
  _Tela_04_BiomaState createState() => _Tela_04_BiomaState();
}

class _Tela_04_BiomaState extends State<Tela_04_Bioma>{

  ProjetoReflorestamento oMeuReflorestamento = ProjetoReflorestamento();

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
      floatingActionButton: botaoProximo( '/tela_05', context, oMeuReflorestamento),

      body: Container(  
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

