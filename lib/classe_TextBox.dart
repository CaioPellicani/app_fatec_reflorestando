import 'package:flutter/material.dart';
import 'main.dart';

class TextBox extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  String msgValidacao = "Insira um Texto";
  bool obrigatorio = false;

  var controle = TextEditingController();
  var teclado = TextInputType.text;
  bool senha = false;
  String label;


  TextBox( String _label, bool _obrigatorio ){
    this.label = _label;
    this.obrigatorio = _obrigatorio;
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
    if( obrigatorio ){
      if( value.isEmpty ){
        return msgValidacao;
      }
    }
    return null;
  }

  bool validarControle() {
    if( obrigatorio )
      return formKey.currentState.validate();
    else
      return true;
  }
}

class TxtLogin extends TextBox{

  TxtLogin( String _label, bool _senha, bool _obrigatorio ) : super( _label, _obrigatorio ){
    this.senha = _senha;
    if( senha )
      msgValidacao = "Insira uma Senha";
    else
      msgValidacao = "Insira o Usuário";
  }

  bool validarLogin(){
    if( ( validarControle() ) && ( controle.text == "Caio" ) ){
      return true;
    }
    return false;
  }

  bool validarSenha(){
    if( ( validarControle() ) && ( controle.text == "123" ) ){
      return true;
    }
        print( msgValidacao );
    return false;
  }
}

class TextBoxNumerico extends TextBox{

  TextBoxNumerico( String _label, bool _obrigatorio ) : super( _label, _obrigatorio ){
    teclado = TextInputType.number;
    msgValidacao = "Insira um Valor Numérico";
  }

  String validador( value ){
    if( obrigatorio ){
      if( value.isEmpty ){
        return msgValidacao;
      }
    }
    if( double.tryParse(value) == null ){
      return msgValidacao;
    }
    return null;
  }

}