import 'package:flutter/material.dart';
import 'meus_widgets.dart';

bool validarUsuario( var usuario, var senha ){
  var usuarioCerto = 'Caio';
  if( ( usuario.toString() == usuarioCerto) ){
    return true;
  }
  else{
    return false;
  }

}