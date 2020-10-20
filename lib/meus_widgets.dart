import 'package:flutter/material.dart';
import 'minhas_funcoes.dart';
import 'main.dart';
import 'classe_projeto.dart';

TextStyle styleBotoes = TextStyle(color: Colors.white, fontSize: 18);

Widget botaoSimples( texto, tela, contexto, bool ativo ){

  return Container(
    padding: EdgeInsets.only(top: ( valorPadding * 2 )),
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
      if ( tela != '' ){
        Navigator.pushNamed(contexto, tela, arguments: oProjeto );
      }
    },
    tooltip: 'Próximo',
    child: Icon(Icons.arrow_right, size: 40,),
    backgroundColor: Theme.of(contexto).primaryColor,
  );
}

Widget botaoLogin( contexto, scaffoldKey, usuario, senha ){
  return Container(
    padding: EdgeInsets.only(top: ( valorPadding * 2 )),
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

Widget aviso( String titulo, String texto ){
  return AlertDialog(
    title: Text(titulo, style: TextStyle(fontSize: 12)),
    content: Text(texto, style: TextStyle(fontSize: 16)),
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
          botaoSimples("Sobre o desenvolvedor", '/tela_02', contexto, true),
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
    return Container(
      padding: EdgeInsets.all(valorPadding),
      child: DropdownButtonFormField(
        value: valorAtual,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all( valorPadding ),
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
      ),
    );
  }
}