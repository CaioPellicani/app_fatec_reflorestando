import 'package:flutter/material.dart';
import 'main.dart';

class TextBox extends StatelessWidget {
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
        keyboardType: teclado,
        controller: controle,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}

class TxtLogin extends TextBox{
  
  TxtLogin( String _label, bool _senha ) : super( _label ){
    this.senha = _senha;
  }

  bool validarLogin(){
    if( controle.text == "Caio" ){
      return true;
    }
    return false;
  }

  bool validarSenha(){
    if( controle.text == "123"){
      return true;
    }
    return false;
  }

}

