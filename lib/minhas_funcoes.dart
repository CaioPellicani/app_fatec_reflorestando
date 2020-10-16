import 'package:flutter/material.dart';
import 'meus_widgets.dart';

bool validarUsuario( String usuario, String senha ){
  var usuarioCerto = 'Caio';
  var senhaCerta = '123';
  if( ( usuario != usuarioCerto) && ( senha != senhaCerta ) ){
    return false;
  }
  return true;
}

ativarBotao( bool ativo, contexto, String tela ){
  if( ativo )
    return (){ Navigator.pushNamed(contexto, tela ); };
  else
    return null;
}