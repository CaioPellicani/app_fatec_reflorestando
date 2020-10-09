import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'meus_widgets.dart';

class Tela_03_Menu extends StatefulWidget {
  @override
  _Tela_03_MenuState createState() => _Tela_03_MenuState();
}

class _Tela_03_MenuState extends State<Tela_03_Menu>{
 
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: Text("Menu de Opções"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),

      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botaoSimples("Sobre o desenvolvedor", '/tela_02', context)
            ],
          ),
        ),
      ),
      drawerEnableOpenDragGesture: false,

      body: Container(child: 
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                botaoSimples('Reflorestamento', '', context),
                botaoSimples('Agrofloresta', '', context),
                botaoSimples('Silvopastoril', '', context),
                botaoSimples('Arboriazação Urbana', '', context),
              ],
            )
          ]
        ),
      ),
    );   
  }
}