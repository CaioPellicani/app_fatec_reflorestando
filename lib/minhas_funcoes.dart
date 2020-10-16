import 'package:flutter/material.dart';
import 'meus_widgets.dart';

bool validarUsuario( String usuario, String senha ){
  var usuarioCerto = 'Caio';
  if( ( usuario != usuarioCerto) ){
    return false;
  }
  return true;
}