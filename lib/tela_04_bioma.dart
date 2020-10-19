import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_04_Bioma extends StatefulWidget {
  @override
  _Tela_04_BiomaState createState() => _Tela_04_BiomaState();
}

class _Tela_04_BiomaState extends State<Tela_04_Bioma>{

  ProjetoReflorestamento oMeuReflorestamento = ProjetoReflorestamento();

  var txtArido = TextEditingController();
  var txtUmido = TextEditingController();
  var txtMisto = TextEditingController();

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
              DropBox("Biomas", txtBioma, biomas),
              DropBox("Tipo", txtApp, apps ),
              caixaTexto("Pecentual de Solo Úmido", txtUmido, true ),
              caixaTexto("Pecentual de Solo Árido", txtArido, true ),
              caixaTexto("Pecentual de Solo Misto", txtMisto, true ),
            ],
          ),
        ),
      ),  
    );
  }
}

