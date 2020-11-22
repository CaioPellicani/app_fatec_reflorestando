import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'main.dart';
import 'model/classe_projeto.dart';
import 'classe_botao.dart';

class Tela_07_RelEspecies extends StatefulWidget {
  @override
  _Tela_07_RelEspeciesState createState() => _Tela_07_RelEspeciesState();
}

class _Tela_07_RelEspeciesState extends State<Tela_07_RelEspecies>{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  
  Widget build(BuildContext context) {

    ProjetoReflorestamento oProjeto = ModalRoute.of(context).settings.arguments; 
    if( oProjeto == null ){ //durante testes evita erros
      oProjeto = ProjetoReflorestamento();
      oProjeto.carregarEspecies();
    }
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Lista de Espécies"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      
      floatingActionButton: BotaoFlutuante(
        hint: 'Reflorestamento', 
        acao: (){
          Navigator.pushNamed( context, "/tela_08", arguments: oProjeto );
        }, 
      ),

      body: Container( 
        padding: EdgeInsets.all(valorPadding),
        child: ListView.separated( 
          itemBuilder: (context,index){
            return CheckboxListTile(
              title: Text( oProjeto.nomePopular(index) ),
              subtitle: Text( oProjeto.nomeCientifico(index), style: TextStyle( fontStyle: FontStyle.italic),),
              secondary: Image.asset("imagens/${oProjeto.checkBoxState(index)}_${oProjeto.funcaoEcologica(index)}.png", scale: 4 ),
              controlAffinity: ListTileControlAffinity.leading,
              value: oProjeto.checkBoxState(index),
              onChanged: ( bool value ){             
                setState(( ) {     
                  oProjeto.setCheckBox( index, value );  
                });
              },
              activeColor: Theme.of(context).primaryColor,
            );
          },
          separatorBuilder: (context, index){
            return Divider(thickness: 1, color: Colors.grey);
          },
          itemCount: oProjeto.especiesLenght
        ),

      ),
    );
  }
}