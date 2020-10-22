import 'package:flutter/material.dart';
import 'main.dart';

class TextBox extends StatelessWidget {
  final formKey;
  final Function validador;

  var _controle = TextEditingController();
  var _teclado;
  bool _senha = false;
  String _label;


  TextBox({ String label, String teclado, this.formKey, this.validador  }){
    this._label = label;

    if (teclado != null) {
      teclado = teclado.toLowerCase();
    }
    switch( teclado ) {
      case "numerico": this._teclado = TextInputType.number;
        break;
      default: this._teclado = TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(valorPadding),
      child: TextFormField(
        key: formKey,
        keyboardType: _teclado,
        controller: _controle,
        obscureText: _senha,
        decoration: InputDecoration(
          labelText: _label,
        ),
        validator: validador,
      ),
    );
  }
  get controle{
    return _controle.text;
  }
}

class TxtLogin extends TextBox{
  final formKey;
  final Function validador;

  TxtLogin( bool senha, { String label, this.formKey, this.validador  } ) : super( label: label,  ){
    this._senha = senha;
  }

  bool validarLogin(){
    if( _controle.text == "Caio" ){
      return true;
    }
    return false;
  }

  bool validarSenha(){
    if( _controle.text == "123" ){
      return true;
    }
    return false;
  }
}

