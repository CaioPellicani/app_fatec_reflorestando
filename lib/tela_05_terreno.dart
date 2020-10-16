import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/material_localizations.dart';
import 'meus_widgets.dart';
import 'classe_projeto.dart';

class Tela_05_Terreno extends StatefulWidget {
  @override
  _Tela_05_TerrenoState createState() => _Tela_05_TerrenoState();
}

class _Tela_05_TerrenoState extends State<Tela_05_Terreno>{
    var scaffoldKey = GlobalKey<ScaffoldState>();
    int radioGrupo;
    List<String> modeloFlorestal = [];

  @override

    void initState(){
      modeloFlorestal.add( 'teste1' );
      modeloFlorestal.add( 'teste2' );
      modeloFlorestal.add( 'teste3' );

      super.initState();
      radioGrupo = 0;
    }

  Widget build(BuildContext context) {
    var oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Terreno e Modelo"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_05', context, oMeuReflorestamento),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all( 5 ),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor, width: 1),
              borderRadius: BorderRadius.all( Radius.circular(10)) 
            ),
            child: Center(
              child: Text( "Ola" ),
            )
          ),
          Container(
            padding: EdgeInsets.all( 5 ),
            margin: EdgeInsets.all( 20 ),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor, width: 1),
              borderRadius: BorderRadius.all( Radius.circular(10)) 
            ),
            child: Column(
              children: [
                Container(
                  child: Text("Modelo Florestal", 
                    style: TextStyle( 
                      color:  Theme.of(context).primaryColor, 
                      fontSize: 20
                    ),
                  ),
                ),
                Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: modeloFlorestal.length,
                    itemBuilder: (context, index){ 
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            activeColor: Theme.of(context).primaryColor,
                            value: index ,
                            groupValue: radioGrupo,
                            onChanged: (index){
                              radioGrupo = index;
                              setState(() {});
                            }
                          ),
                          Text( modeloFlorestal[index],style: TextStyle( fontSize: 20 ), ),
                        ],
                      );  
                    }          
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
