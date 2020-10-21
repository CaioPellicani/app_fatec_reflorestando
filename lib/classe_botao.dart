import 'package:flutter/material.dart';
import 'main.dart';

class Botao extends StatelessWidget {
  final Function acao;
  final label;

  Botao( { this.label, this.acao } ){
  }

  @override

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: ( valorPadding * 2 )),
        child: RaisedButton(
          child: Text( label, style: TextStyle(color: Colors.white, fontSize: 18) ),
          color: Theme.of(context).primaryColor,
          onPressed: acao,
      ),
    );
  }
}