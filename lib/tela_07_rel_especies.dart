import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'main.dart';
import 'classe_projeto.dart';

class Tela_07_RelEspecies extends StatefulWidget {
  @override
  _Tela_07_RelEspeciesState createState() => _Tela_07_RelEspeciesState();
}

class _Tela_07_RelEspeciesState extends State<Tela_07_RelEspecies>{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  
  Widget build(BuildContext context) {

    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    if( oMeuReflorestamento == null ){ //durante testes evita erros
      oMeuReflorestamento = ProjetoReflorestamento();
    }
    oMeuReflorestamento.carregarEspecies();
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Lista de Espécies"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_08', context, oMeuReflorestamento),

      body: Container( 
        padding: EdgeInsets.all(valorPadding),
        child: ListView.separated( 
          itemBuilder: (context,index){
            return CheckboxListTile(
              title: Text( oMeuReflorestamento.getNomePopular(index) ),
              subtitle: Text( oMeuReflorestamento.getNomeCientifico(index), style: TextStyle( fontStyle: FontStyle.italic),),
              secondary: Container(
                padding: EdgeInsets.all(valorPadding / 1.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text( oMeuReflorestamento.getFuncaoEcologica(index), style: TextStyle( color: Colors.white),)
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: oMeuReflorestamento.getCheckBox(index),
              onChanged: ( bool value ){             
                setState(() {     
                  oMeuReflorestamento.setCheckBox( index, value );  
                });
              },
              activeColor: Theme.of(context).primaryColor,
            );
          },
          separatorBuilder: (context, index){
            return Divider(thickness: 1, color: Colors.grey);
          },
          itemCount: oMeuReflorestamento.getEspeciesLenght
        ),

      ),
    );
  }
}