import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'main.dart';
import 'model/classe_projeto.dart';
import 'classe_text_box.dart';
import 'classe_botao.dart';

class Tela_05_Terreno extends StatefulWidget {
  @override
  _Tela_05_TerrenoState createState() => _Tela_05_TerrenoState();
}

class _Tela_05_TerrenoState extends State<Tela_05_Terreno>{
    var modeloFlorestalSelecionado;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> modeloFlorestal = [];

  @override

    void initState(){
      modeloFlorestal.add( 'PSC' );
      modeloFlorestal.add( 'PSSC');

      super.initState();
      modeloFlorestalSelecionado = 0;
    }

  Widget build(BuildContext context) {

    ProjetoReflorestamento oProjeto = ModalRoute.of(context).settings.arguments; 
    if( oProjeto == null ){ //durante testes evita erros
      oProjeto = ProjetoReflorestamento();
    }
 
    TextBox oNomeProjeto;
    TextBox oArea;
    TextBox oDistancia;

    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Terreno e Modelo"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: Botao(
        label: 'Prosseguir', 
        acao: (){
          oProjeto.setNomeProjeto = oNomeProjeto.text;
          oProjeto.setArea = oArea.text;
          oProjeto.setDistancia = oDistancia.text;
          oProjeto.setModeloFlorestal = modeloFlorestal[ modeloFlorestalSelecionado ];
          Navigator.pushNamed( context, "/tela_07", arguments: oProjeto );
        }, 
      ),

      body: Center(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              oNomeProjeto = TextBox(label: "Nome da Propriedade"),
              oArea =        TextBox(label: "Área Total ( ha )", teclado: "numerico",),
              oDistancia =   TextBox(label: "Distância entre covas ( m )", teclado: "numerico", ),

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
                      title: Container(
                        margin: EdgeInsets.all(valorPadding),
                        padding: EdgeInsets.all(valorPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all( Radius.circular(10)) 
                        ),
                        child: Image.asset('imagens/${modeloFlorestal[0]}.png' , scale: 2)),
                      value: 0,
                      groupValue: modeloFlorestalSelecionado,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: ( value ){
                        setState(() {
                          modeloFlorestalSelecionado = value;
                        });
                      },
                    ),
                    RadioListTile(
                       title: Container(
                        margin: EdgeInsets.all(valorPadding),
                        padding: EdgeInsets.all(valorPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all( Radius.circular(10)) 
                        ),
                      child: Image.asset('imagens/${modeloFlorestal[1]}' , scale: 2)),                     value: 1,
                      groupValue: modeloFlorestalSelecionado,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: ( value){
                        setState(() {
                          modeloFlorestalSelecionado = value;
                        });
                      },
                    ),
                    Text( "Legenda", style: TextStyle( fontSize: 15, color:Colors.grey, fontWeight: FontWeight.bold),),
                    Row( children: [
                      Expanded(
                        child: Container( 
                          padding: EdgeInsets.fromLTRB(valorPadding, 0, valorPadding, valorPadding),
                          child: Image.asset('imagens/legenda.png' ),
                        )
                      ),
                    ], ),
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