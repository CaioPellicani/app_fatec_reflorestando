import 'package:flutter/material.dart';
import 'tela_01_login.dart';
import 'tela_02_sobre.dart';
import 'tela_03_menu.dart';
import 'tela_04_bioma.dart';
import 'tela_05_terreno.dart';
import 'tela_06_rel_preliminar.dart';
import 'tela_07_rel_especies.dart';
import 'tela_08_exportar.dart';

const double valorPadding = 20;

var scaffoldKey = GlobalKey<ScaffoldState>();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reflorestar',

      theme: ThemeData(
        primaryColor: Colors.green[900],
        backgroundColor: Colors.green[400],
        fontFamily: 'Roboto',        
      ),

      initialRoute: '/tela_04',
      routes: {
       '/tela_01' : (context) => Tela_01_Login(),
       '/tela_02' : (context) => Tela_02_Sobre(),
       '/tela_03' : (context) => Tela_03_Menu(),
       '/tela_04' : (context) => Tela_04_Bioma(),
       '/tela_05' : (context) => Tela_05_Terreno(),
       '/tela_06' : (context) => Tela_06_RelPreliminar(),
       '/tela_07' : (context) => Tela_07_RelEspecies(),
       '/tela_08' : (context) => Tela_08_Exportar(),
      }
    )
  );
}

