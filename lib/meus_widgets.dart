import 'package:flutter/material.dart';
import 'minhas_funcoes.dart';

var styleBotoes = TextStyle(color: Colors.white, fontSize: 18);

Widget caixaTexto(texto, controle){
  return Container(
    padding: EdgeInsets.all(20),
      child: TextField(
        controller: controle,
        decoration: InputDecoration(
          labelText: texto,
        ),
      ),
  );
}

Widget botaoSimples( texto, tela, contexto ){
  return Container(
    padding: EdgeInsets.only(top: 40),
    child: RaisedButton(
      child: Text( 
        texto, style: styleBotoes,
      ),
      color: Theme.of(contexto).primaryColor,
      onPressed: (){
        Navigator.pushNamed(contexto, tela );
      }
    ),
  );
}

Widget botaoLogin( contexto, scaffoldKey, usuario, senha ){
  return Container(
    padding: EdgeInsets.only(top: 40),
    child: RaisedButton(
      child: Text( 
        'Entrar', 
          style: styleBotoes,
      ),
      color: Theme.of(contexto).primaryColor,
      onPressed: (){
        if( validarUsuario(usuario.text, senha.text) )
          Navigator.pushNamed(contexto, '/tela_03' );
        else
          scaffoldKey.currentState.showSnackBar( 
            SnackBar(
              content: Text('Usuário ou Senha Inválida' ),
              duration: Duration(seconds: 3),  
            ),
          );
      }
    ),
  );
}

Widget barraPadrao(String texto){
  return AppBar(
    title: Text(texto),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () { Scaffold.of(context).openDrawer(); },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  );
}

Widget menuBarra(contexto){
  return Drawer(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          botaoSimples("Voltar ao Menu", '/tela_03', contexto),
          botaoSimples("Sobre o desenvolvedor", '/tela_02', contexto)
        ],
      ),
    ),
  );
}
