import 'package:flutter/material.dart';
import 'main.dart';

class TextBox extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  String msgValidacao = "Insira um Texto";

  var controle = TextEditingController();
  var teclado = TextInputType.text;
  bool senha = false;
  String label;


  TextBox( String _label ){
    this.label = _label;
  }

  @override

  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(valorPadding),
      child: TextFormField(
        key: formKey,
        keyboardType: teclado,
        controller: controle,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: ((value) => validador( value )),
      ),
    );
  }
  String validador( value ){
    if( value.isEmpty ){
      return msgValidacao;
    }
    return null;
  }

  bool validarControle() => formKey.currentState.validate();
}

class TxtLogin extends TextBox{

  TxtLogin( String _label, bool _senha ) : super( _label ){
    this.senha = _senha;
    if( senha )
      msgValidacao = "Insira uma Senha";
    else
      msgValidacao = "Insira o Usuário";
  }

  bool validarLogin(){
    //if( ( validarControle() ) && ( controle.text == "Caio" ) ){
    if( controle.text == "Caio" ){
      return true;
    }
    return false;
  }

  bool validarSenha(){
    //if( ( validarControle() ) && ( controle.text == "123" ) ){
    if( controle.text == "123"){
      return true;
    }
        print( msgValidacao );
    return false;
  }

}

