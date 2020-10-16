import 'package:flutter/material.dart';
import 'minhas_funcoes.dart';

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
        texto, 
        style: TextStyle(color: Colors.white, fontSize: 18),
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
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      color: Theme.of(contexto).primaryColor,
      onPressed: (){
        if( validarUsuario(usuario.text, senha.text) )
          Navigator.pushNamed(contexto, '/tela_03' );
        else
          scaffoldKey.currentState.showSnackBar( senhaInvalida );
      }
    ),
  );
}

final senhaInvalida = SnackBar(
  content: Text('Usuário ou Senha Inválida' ),
  duration: Duration(seconds: 3),
);
