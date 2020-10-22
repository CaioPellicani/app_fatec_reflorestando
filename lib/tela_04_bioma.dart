import 'package:flutter/material.dart';
import 'package:p1_app_reflorestar/classe_botao.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';
import 'classe_text_box.dart';

class Tela_04_Bioma extends StatefulWidget {
  @override
  _Tela_04_BiomaState createState() => _Tela_04_BiomaState();
}

class _Tela_04_BiomaState extends State<Tela_04_Bioma>{
  TextBox oArido;
  TextBox oUmido;
  TextBox oMisto;

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

    ProjetoReflorestamento oProjeto = ModalRoute.of(context).settings.arguments; 
    if( oProjeto == null ){ //durante testes evita erros
      oProjeto = ProjetoReflorestamento();
    }

    return Scaffold(    
      appBar: barraPadrao("Bioma e Terreno"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,

      floatingActionButton: BotaoFlutuante(
        hint: 'Reflorestamento', 
        acao: (){
          Navigator.pushNamed( context, "/tela_05", arguments: oProjeto );
        }, 
      ),

      body: SingleChildScrollView(
        child: Container(  
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropBox( "Biomas", txtBioma, biomas ),
                DropBox( "Tipo", txtApp, apps ),
                oArido = TextBox( label: "Pecentual de Solo Úmido ( % )", teclado: "Numerico", ),
                oUmido = TextBox( label: "Pecentual de Solo Árido ( % )", teclado: "numerico", ),
                oMisto = TextBox( label: "Pecentual de Solo Misto ( % )", teclado: "numerico", ),
              ],
            ),
          ),
        ),
      ),  
    );
  }
}

