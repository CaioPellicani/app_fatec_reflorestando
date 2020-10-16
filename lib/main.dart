import 'package:flutter/material.dart';
import 'package:p1_app_reflorestar/tela_04_bioma.dart';
import 'tela_01_login.dart';
import 'tela_02_sobre.dart';
import 'tela_03_menu.dart';
import 'tela_04_bioma.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reflorestar',

      theme: ThemeData(
        primaryColor: Colors.green[900],
        backgroundColor: Colors.green[100],
        fontFamily: 'Roboto',
        
      ),

      initialRoute: '/tela_04',
      routes: {
       '/tela_01' : (context) => Tela_01_Login(),
       '/tela_02' : (context) => Tela_02_Sobre(),
       '/tela_03' : (context) => Tela_03_Menu(),
       '/tela_04' : (context) => Tela_04_bioma(),
      }
    )
  );
}

