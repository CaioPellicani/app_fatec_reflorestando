import 'package:flutter/material.dart';
import 'main.dart';

class TextBox extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  String _msgValidacao = "Insira um Texto";
  bool _obrigatorio = false;

  var _controle = TextEditingController();
  var _teclado = TextInputType.text;
  bool _senha = false;
  String _label;


  TextBox( String label, bool obrigatorio ){
    this._label = label;
    this._obrigatorio = obrigatorio;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(valorPadding),
      child: TextFormField(
        key: _formKey,
        keyboardType: _teclado,
        controller: _controle,
        obscureText: _senha,
        decoration: InputDecoration(
          labelText: _label,
        ),
        validator: ((value) => validador( value )),
      ),
    );
  }
  get controle{
    return _controle.text;
  }
  
  
  String validador( value ){
    if( _obrigatorio ){
      if( value.isEmpty ){
        return _msgValidacao;
      }
    }
    return null;
  }

  bool validarControle() {
    if( _obrigatorio )
      return _formKey.currentState.validate();
    else
      return true;
  }
}

class TxtLogin extends TextBox{

  TxtLogin( String label, bool senha, bool obrigatorio ) : super( label, obrigatorio ){
    this._senha = senha;
    if( _senha )
      _msgValidacao = "Insira uma Senha";
    else
      _msgValidacao = "Insira o Usuário";
  }

  bool validarLogin(){
    if( ( validarControle() ) && ( _controle.text == "Caio" ) ){
      return true;
    }
    return false;
  }

  bool validarSenha(){
    if( ( validarControle() ) && ( _controle.text == "123" ) ){
      return true;
    }
        print( _msgValidacao );
    return false;
  }
}

class TextBoxNumerico extends TextBox{

  TextBoxNumerico( String label, bool obrigatorio ) : super( label, obrigatorio ){
    _teclado = TextInputType.number;
    _msgValidacao = "Insira um Valor Numérico";
  }

  String validador( value ){
    if( _obrigatorio ){
      if( value.isEmpty ){
        return _msgValidacao;
      }
    }
    if( double.tryParse(value) == null ){
      return _msgValidacao;
    }
    return null;
  }

}