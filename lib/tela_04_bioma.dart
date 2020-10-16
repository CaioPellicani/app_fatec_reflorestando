import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_04_bioma extends StatefulWidget {
  @override
  _Tela_04_biomaState createState() => _Tela_04_biomaState();
}

class _Tela_04_biomaState extends State<Tela_04_bioma>{

  Projeto o_MeuProjeto = Projeto();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> biomas = [];
  String txtBioma = 'Amazônia';

  @override
  void initState(){
    biomas.add( "Amazônia" );
    biomas.add( "Cerrado" );
    biomas.add( "Pantanal" );
    biomas.add( "Mata Atlântica");

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: barraPadrao("Bioma e Terreno"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,

      body: Container( 
        
        child: Center(
          child: DropdownButton<String>(
            value: txtBioma,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 2,
            ),


            onChanged: (String novoValor) {
              setState(() {
                txtBioma = novoValor;
              });
            },

            items: biomas.map((String bioma) {
                return DropdownMenuItem<String>(
                  value: bioma,
                  child: Text(bioma),
                );
              }
            ).toList(),
          ),
        ),
      ),
    );
  }
}