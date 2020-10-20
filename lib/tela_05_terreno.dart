import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'main.dart';
import 'classe_projeto.dart';
import 'classe_TextBox.dart';

class Tela_05_Terreno extends StatefulWidget {
  @override
  _Tela_05_TerrenoState createState() => _Tela_05_TerrenoState();
}

class _Tela_05_TerrenoState extends State<Tela_05_Terreno>{
    var radioGrupo;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> modeloFlorestal = [];

  @override

    void initState(){
      modeloFlorestal.add( 'P-S-C-S' );
      modeloFlorestal.add( 'P-S-P-C-P-S' );
      modeloFlorestal.add( 'SSSS');

      super.initState();
      radioGrupo = 0;
    }

  Widget build(BuildContext context) {
    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    TextBox oNomeProjeto;
    TextBoxNumerico oArea;
    TextBoxNumerico oDistancia;
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Terreno e Modelo"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_07', context, oMeuReflorestamento),

      body: Center(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              oNomeProjeto = TextBox("Nome da Propriedade", false),
              oArea = TextBoxNumerico("Área Total (ha)", false),
              oDistancia = TextBoxNumerico("Distância entre covas (m)", false ),   

              Container(
                margin: EdgeInsets.all(valorPadding),
                padding: EdgeInsets.fromLTRB(0, valorPadding, 0, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all( Radius.circular(10)) 
                ),
                child: Column(
                  children: [
                    Text( "Modelo Florestal", style: TextStyle( fontSize: 18, color:Colors.grey, fontWeight: FontWeight.bold),),
                    RadioListTile(
                      title: Text( modeloFlorestal[0] ),
                      value: 0,
                      groupValue: radioGrupo,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: ( value ){
                        setState(() {
                          radioGrupo = value;
                          oNomeProjeto.controle = oNomeProjeto.controle;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text( modeloFlorestal[1] ),
                      value: 1,
                      groupValue: radioGrupo,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: ( value){
                        setState(() {
                          radioGrupo = value;
                        });
                      },
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