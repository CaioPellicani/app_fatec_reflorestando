import 'package:flutter/material.dart';
import 'minhas_funcoes.dart';
import 'classe_projeto.dart';

TextStyle styleBotoes = TextStyle(color: Colors.white, fontSize: 18);

Widget caixaTexto(texto, controle){
  return Container(
    padding: EdgeInsets.all(20),
      child: TextField(
        controller: controle,
        decoration: InputDecoration(
          labelText: texto,
        ),
      ),
  );
}

Widget botaoSimples( texto, tela, contexto, bool ativo ){

  return Container(
    padding: EdgeInsets.only(top: 40),
    child: RaisedButton(
      child: Text( 
        texto, style: styleBotoes,
      ),
      color: Theme.of(contexto).primaryColor,
      onPressed: ativarBotao(ativo, contexto, tela)
    ),
  );
}

Widget botaoProximo( String tela, contexto, oProjeto  ){
  return FloatingActionButton(
    onPressed: (){
      Navigator.pushNamed(contexto, tela, arguments: oProjeto );
    },
    tooltip: 'Próximo',
    child: Icon(Icons.arrow_right, size: 40,),
    backgroundColor: Theme.of(contexto).primaryColor,
  );
}

Widget botaoLogin( contexto, scaffoldKey, usuario, senha ){
  return Container(
    padding: EdgeInsets.only(top: 40),
    child: RaisedButton(
      child: Text( 
        'Entrar', 
          style: styleBotoes,
      ),
      color: Theme.of(contexto).primaryColor,
      onPressed: (){
        if( validarUsuario(usuario.text, senha.text) )
          Navigator.pushNamed(contexto, '/tela_03' );
        else
          scaffoldKey.currentState.showSnackBar( 
            SnackBar(
              content: Text('Usuário ou Senha Inválida' ),
              duration: Duration(seconds: 3),  
            ),
          );
      }
    ),
  );
}

Widget barraPadrao(String texto){
  return AppBar(
    title: Text(texto),
    centerTitle: true,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () { Scaffold.of(context).openDrawer(); },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  );
}

Widget menuBarra(contexto){
  return Drawer(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          botaoSimples("Voltar ao Menu", '/tela_03', contexto, true),
          botaoSimples("Sobre o desenvolvedor", '/tela_02', contexto, true)
        ],
      ),
    ),
  );
}

class DropBox extends StatefulWidget {
  List<String> lista;
  String label;
  String valorAtual;

  DropBox( String _label, String _valorAtual, List<String> _lista ){
    this.label = _label;
    this.valorAtual = _valorAtual;
    this.lista = _lista;
  }

  @override
  _DropBoxState createState() => _DropBoxState( label, valorAtual,lista );
}

class _DropBoxState extends State<DropBox>{
  List<String> lista;
  String label;
  String valorAtual;

    _DropBoxState( String _label, String _valorAtual, List<String> _lista  ){
    this.label = _label;
    this.valorAtual = _valorAtual;
    this.lista = _lista;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: valorAtual,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all( 20 ),
          labelStyle: TextStyle(),
          labelText: label),
      
      onChanged: (String novoValor) {
        setState(() {
          valorAtual = novoValor;
        });
      },

      items: this.lista.map((String bioma) {
          return DropdownMenuItem<String>(
            value: bioma,
            child: Text(bioma),
          );
        }
      ).toList(),
    );
  }
}

//RadioGroup( "Modelo Florestal", modeloFlorestal )
class RadioGroup extends StatefulWidget {
  String nomeGrupo;
  List<String> lista;

  RadioGroup( String _nomeGrupo, List<String> _lista ){
    this.nomeGrupo = _nomeGrupo;
    this.lista = _lista;
  }

  @override
  _RadioGroupState createState() => _RadioGroupState( nomeGrupo, lista);
}

class _RadioGroupState extends State<RadioGroup> {
  String nomeGrupo;
  List<String> lista;

  _RadioGroupState( String _nomeGrupo, List<String> _lista ){
    this.nomeGrupo = _nomeGrupo;
    this.lista = _lista;
  }
  int radioGrupo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 5 ),
      margin: EdgeInsets.all( 20 ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.all( Radius.circular(10)) 
      ),
      child: Column(
        children: [
          Container(
            child: Text( nomeGrupo, 
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
              itemCount: lista.length,
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
                    Text( lista[index],style: TextStyle( fontSize: 20 ), ),
                  ],
                );  
              }          
            ),
          ),
        ],
      )

    );
  }
}

