import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'classe_TextBox.dart';
import 'main.dart';
import 'minhas_funcoes.dart';

class Tela_01_Login extends StatefulWidget {
  @override
  _Tela_01_LoginState createState() => _Tela_01_LoginState();
}

class _Tela_01_LoginState extends State<Tela_01_Login>{
    
    var txtUsuario = TextEditingController();
    var txtSenha = TextEditingController();
    TxtLogin oTxtUsuario;
    TxtLogin oTxtSenha;
    var scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      body: Container( child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Container( 
              padding: EdgeInsets.all( 20 ),
              child: Text('Florestando', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 30),),
            ),
            Container( 
             padding: EdgeInsets.all(20),           
              child:  Image.asset("imagens/forest.png", scale: 3, )
            ),
            oTxtUsuario =  TxtLogin("Usuário", /*txtUsuario,*/ false),
            oTxtSenha = TxtLogin('Senha', /*txtSenha,*/ true),

            //botaoLogin(context, scaffoldKey, txtUsuario, txtSenha),

            Container(
              padding: EdgeInsets.only(top: ( valorPadding * 2 )),
              child: RaisedButton(
                child: Text( 'Entrar', style: styleBotoes, ),
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if( ( oTxtUsuario.validarLogin() ) && ( oTxtSenha.validarSenha() ) )
                    Navigator.pushNamed(context, '/tela_03' );
                  else
                    scaffoldKey.currentState.showSnackBar( 
                      SnackBar(
                        content: Text('Usuário ou Senha Inválida' ),
                        duration: Duration(seconds: 3),  
                      ),
                    );
                }
              ),
            ),
          ]    
        )
      ),
    );
  }
}

