import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p1_app_reflorestar/classe_botao.dart';
import 'package:p1_app_reflorestar/meus_widgets.dart';
import 'classe_text_box.dart';
import 'classe_botao.dart';
import 'main.dart';
import 'model/usuario.dart';


class Tela_01_Login extends StatefulWidget {
  @override
  _Tela_01_LoginState createState() => _Tela_01_LoginState();
}

class _Tela_01_LoginState extends State<Tela_01_Login>{
  TxtLogin oTxtUsuario;
  TxtLogin oTxtSenha;
  Usuario usuario;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var db = FirebaseFirestore.instance.collection("usuarios");
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container( child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Container( 
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Text('Florestando', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 30),),
              ),
              Container( 
               padding: EdgeInsets.all(valorPadding),           
                child:  Image.asset("imagens/forest.png", scale: 3, )
              ),

              oTxtUsuario = TxtLogin(  
                false, 
                texto: "Caio",
                label: "Usuário", 
                //formKey: formKey,
                validador: (value){
                  if( value.isEmpity){
                    return "Insira um Usuário";
                  }
                  return null;
                },
              ),

              oTxtSenha = TxtLogin( 
                true, 
                texto: "123",
                label: "Senha", 
                //formKey: formKey,
                validador: (value){
                  if( value.isEmpity){
                    return "Insira uma Senha";
                  }
                  return null;
                },
              ),

              Botao( label: "Entrar",
                acao: () {
                db.where( "usuario", isEqualTo: oTxtUsuario.text )
                  .get()
                  .then( ( dados ) {
                    if( dados.size > 0 && oTxtSenha.text == dados.docs.elementAt( 0 ).data()["senha"].toString() ){
                      Navigator.pushNamed(context, '/tela_03' );
                    }
                    else {
                    scaffoldKey.currentState.showSnackBar( 
                      SnackBar(
                        content: Text('Usuário ou Senha Inválida' ),
                        duration: Duration(seconds: 3),  
                      ),
                    );
                  }
                  });
    
                }
              )
            ]    
          )
        ),
      ),
    );
  }

}

