import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p1_app_reflorestar/classe_botao.dart';
import 'classe_text_box.dart';
import 'classe_botao.dart';
import 'main.dart';


class Tela_01_Login extends StatefulWidget {
  @override
  _Tela_01_LoginState createState() => _Tela_01_LoginState();
}

class _Tela_01_LoginState extends State<Tela_01_Login>{
  TxtLogin oTxtUsuario;
  TxtLogin oTxtSenha;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  StreamSubscription<QuerySnapshot> ouvidor;  
  var db = FirebaseFirestore.instance;
  @override

  void initState(){
    super.initState();

    ouvidor?.cancel();

    ouvidor = db.collection("usuarios").snapshots().listen((result) {
      print( result );
    });

  }

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
                  if(( oTxtUsuario.validarLogin() ) &&  ( oTxtSenha.validarSenha()))
                    print( "Navigator.pushNamed(context, '/tela_03' )");
                  else
                    scaffoldKey.currentState.showSnackBar( 
                      SnackBar(
                        content: Text('Usuário ou Senha Inválida' ),
                        duration: Duration(seconds: 3),  
                      ),
                    );
                }
              )
            ]    
          )
        ),
      ),
    );
  }

}

