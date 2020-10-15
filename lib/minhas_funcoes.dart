import 'package:flutter/material.dart';
import 'meus_widgets.dart';

bool validarUsuario( var usuario, var senha ){
  var usuarioCerto = 'Caio';
  if( ( usuario.text == usuarioCerto) ){
    return true;
  }
  else{
    return false;
  }
}