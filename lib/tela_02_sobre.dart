import 'package:flutter/material.dart';
import 'meus_widgets.dart';

class Tela_02_Sobre extends StatelessWidget {

    var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
            appBar: AppBar( 
          title: Text("nome"),
      ),

      body: Container( child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            Container(
              decoration: BoxDecoration( 
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.all( 
                  Radius.circular(10)
                ),
              ),
            ),
          ]          
        ),
      ),
    );
  }
}