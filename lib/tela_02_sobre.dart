import 'package:flutter/material.dart';
import 'main.dart';
import 'meus_widgets.dart';

class Tela_02_Sobre extends StatelessWidget {

    var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
            appBar: AppBar( 
          title: Text("Sobre o Desenvolvedor"),
      ),

      body: Container( child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [   
              //SizedBox( height: 30 ),
              Container(
                padding: EdgeInsets.all( valorPadding ),
                decoration: BoxDecoration( 
                  shape: BoxShape.circle,
                ),
                child: Image.asset("imagens/Caio.png", scale: 2, ),
              ),
              Container(
                padding: EdgeInsets.all( valorPadding ),
                margin: EdgeInsets.all(valorPadding),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Text( "Desenvolvedor: Caio Damasceno Pellicani\n",
                      style: TextStyle( color: Colors.white, fontSize: 20, ),
                    ),
                    Text( "\tGraduando em Analise e Desenvolvimento de Sistemas pela FATEC - Ribeirão Preto.\n",
                      style: TextStyle( color: Colors.white, fontSize: 15, ),
                      textAlign: TextAlign.justify,
                    ),
                    Text( "\tFormado em Gestão Ambiental pela ESALQ-USP e tem por objetivo buscar alternativas " + 
                            "para mitigar problemas de carater ambiental por meio de soluções tecnologicas.\n",
                      style: TextStyle( color: Colors.white, fontSize: 15, ),
                      textAlign: TextAlign.justify,
                    ),
                    Text( "\tO presente aplicativo busca auxiliar o trabalho de tecnicos no momento da escolha das espécies " +
                            "florestais que serão implementados em projetos de reflorestamento, e futuramente também para projetos " +
                            "agroflorestais, silviopastoril e arborização urbana.\n",
                      style: TextStyle( color: Colors.white, fontSize: 15, ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}