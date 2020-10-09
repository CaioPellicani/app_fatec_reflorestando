import 'package:flutter/material.dart';
import 'meus_widgets.dart';

class Tela_01_Login extends StatefulWidget {
  @override
  _Tela_01_LoginState createState() => _Tela_01_LoginState();
}

class _Tela_01_LoginState extends State<Tela_01_Login>{
    
    var txtUsuario = TextEditingController();
    var txtSenha = TextEditingController();
    var scaffoldKey = GlobalKey<ScaffoldState>();

  @override

  
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
            caixaTexto('Usuário', txtUsuario),
            caixaTexto('Senha', txtSenha),
            botaoSimples('Entrar', '/tela_03', context),
          ]    
        )
      ),
    );
  }
}
