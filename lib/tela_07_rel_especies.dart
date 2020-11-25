import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'main.dart';
import 'model/arvore.dart';
import 'model/classe_projeto.dart';
import 'classe_botao.dart';

class Tela_07_RelEspecies extends StatefulWidget {
  @override
  _Tela_07_RelEspeciesState createState() => _Tela_07_RelEspeciesState();
}

class _Tela_07_RelEspeciesState extends State<Tela_07_RelEspecies>{
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<Arvore> listaArvores = List();

  StreamSubscription<QuerySnapshot>ouvidor;
  var db = FirebaseFirestore.instance.collection("arvores");

  @override

  void initState(){
    super.initState();        
    ouvidor?.cancel();

    ouvidor = db.snapshots().listen( ( result ){  
      setState((){
        listaArvores = result.docs.map( (e) => Arvore.fromMap( e.data(), e.id) ).toList();
      });
    });
  }
  
  Widget build(BuildContext context) {

    ProjetoReflorestamento oProjeto = ModalRoute.of(context).settings.arguments; 
    if( oProjeto == null ){ //durante testes evita erros
      oProjeto = ProjetoReflorestamento();
    }
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Lista de Espécies"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,   
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Botao(
          label: 'Finalizar Projeto', 
          acao: (){
            oProjeto.setListaArvores = listaArvores;
            oProjeto.finalizarProjeto();
            Navigator.pushNamed( context, "/tela_08", arguments: oProjeto );
          }, 
        ),
      ),

      body: Container( 
        padding: EdgeInsets.all(valorPadding),
        
        child: StreamBuilder<QuerySnapshot>(
          stream: db.snapshots(),
          builder: (context, snapshot){
            switch( snapshot.connectionState ){
              case ConnectionState.none :
                return Center(child: Text( "Erro: Falha de Conexao" ) );
              /*case ConnectionState.waiting :
                return Center(child:CircularProgressIndicator());*/
              default :
                return listCheckBoxArvores();
            }
          }
        ),
      ),
    );
  }

  Widget listCheckBoxArvores(){
    return ListView.separated( 
      itemBuilder: (context,index){
        return CheckboxListTile(
          title: Text( listaArvores[index].nomePopular ),
          subtitle: Text( listaArvores[index].nomeCientifico, style: TextStyle( fontStyle: FontStyle.italic),),
          secondary: Image.asset("imagens/${listaArvores[index].checkBoxState}_${listaArvores[index].funcaoEcologica}.png", scale: 4 ),
          controlAffinity: ListTileControlAffinity.leading,
          value: listaArvores[index].checkBoxState,
          onChanged: ( bool value ){             
            setState(( ) {     
              listaArvores[index].setCheckBoxState = value;  
            });
          },
          activeColor: Theme.of(context).primaryColor,
        );
      },
      separatorBuilder: (context, index){
        return Divider(thickness: 1, color: Colors.grey);
      },
      itemCount: listaArvores.length
    );
  }
}
        