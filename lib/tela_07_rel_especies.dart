import 'package:flutter/material.dart';
import 'meus_widgets.dart';
import 'main.dart';
import 'classe_projeto.dart';

class Tela_07_RelEspecies extends StatefulWidget {
  @override
  _Tela_07_RelEspeciesState createState() => _Tela_07_RelEspeciesState();
}

class _Tela_07_RelEspeciesState extends State<Tela_07_RelEspecies>{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> checkBox = [true, true, true, true, true];
  List<String> nomePopular = [];
  List<String> nomeCientifico = [];
  List<String> funcaoEcologica = [];

  void initState(){
    nomePopular.add('Paricá');
    nomeCientifico.add('Schizolobium amazonicum');
    funcaoEcologica.add('P');

    nomePopular.add('Ipê-Amarelo');
    nomeCientifico.add('Handroanthus serratifolius');
    funcaoEcologica.add('S');

    nomePopular.add('Copaíba');
    nomeCientifico.add('Copaifera glycycarpa');   
    funcaoEcologica.add('C');

    nomePopular.add('Seringueira');
    nomeCientifico.add('Hevea brasiliensis');
    funcaoEcologica.add('S');

    nomePopular.add('Tucumã');
    nomeCientifico.add('Astrocaryum aculeatum');
    funcaoEcologica.add('S'); 

    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    ProjetoReflorestamento oMeuReflorestamento = ModalRoute.of(context).settings.arguments; 
 
    return Scaffold(
      key: scaffoldKey,      
         appBar: barraPadrao("Lista de Espécies"),
      drawer: menuBarra(context),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: botaoProximo( '/tela_08', context, oMeuReflorestamento),

      body: Container( 
        padding: EdgeInsets.all(valorPadding),
        child: ListView.separated( 
          itemBuilder: (context,index){
            return CheckboxListTile(
              title: Text( nomePopular[index] ),
              subtitle: Text( nomeCientifico[index], style: TextStyle( fontStyle: FontStyle.italic),),
              secondary: Container(
                padding: EdgeInsets.all(valorPadding / 1.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text( funcaoEcologica[index], style: TextStyle( color: Colors.white),)
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBox[index],
              onChanged: ( bool value ){             
                setState(() {     
                  checkBox[index] = value;  
                });
              },
              activeColor: Theme.of(context).primaryColor,
            );
          },
          separatorBuilder: (context, index){
            return Divider(thickness: 1, color: Colors.grey);
          },
          itemCount: 5,
        ),

      ),
    );
  }
}