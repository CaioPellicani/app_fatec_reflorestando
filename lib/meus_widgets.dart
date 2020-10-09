import 'package:flutter/material.dart';
import 'main.dart';

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
