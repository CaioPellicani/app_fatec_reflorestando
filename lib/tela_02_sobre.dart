import 'package:flutter/material.dart';
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
              SizedBox( height: 30 ),
              Container(
                padding: EdgeInsets.all( 20 ),
                decoration: BoxDecoration( 
                  shape: BoxShape.circle,
                ),
                child: Image.asset("imagens/Caio.png", scale: 1.5, ),
              ),
              Container(
                padding: EdgeInsets.all( 20 ),
                margin: EdgeInsets.all(20),
      
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Text( "Nome: Caio Damasceno Pellicani\n",
                      style: TextStyle( color: Colors.white, fontSize: 20, ),
                    ),
                    Text( "\tGraduando em Analise e Desenvolvimento de Sistemas pela FATEC - Ribeirão Preto\n",
                      style: TextStyle( color: Colors.white, fontSize: 15, ),
                      textAlign: TextAlign.justify,
                    ),
                    Text( "\tFormado em Gestão Ambiental pela ESALQ-USP e tem por objetivo buscar alternativas para mitigar problemas de carater ambiental por meio de soluções tecnologicas\n",
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