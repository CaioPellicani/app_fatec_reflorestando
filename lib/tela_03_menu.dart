import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'meus_widgets.dart';

class Tela_03_Menu extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: barraPadrao("Menu de Opções"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,

      body: Container(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all( 10 ),
            shrinkWrap: true,
            children: [
              botaoSimples('Reflorestamento', '/tela_04', context),
              botaoSimples('Agrofloresta', '', context),
              botaoSimples('Silvopastoril', '', context),
              botaoSimples('Arboriazação Urbana', '', context),
            ],
          ),
        ),
      )
    );   
  }
}
