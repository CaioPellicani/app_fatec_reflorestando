import 'package:flutter/material.dart';
import 'minhas_funcoes.dart';
import 'main.dart';
import 'classe_projeto.dart';

TextStyle styleBotoes = TextStyle(color: Colors.white, fontSize: 18);

Widget caixaTexto(texto, controle, bool numerico){
  var teclado;

  if( numerico ){
    teclado = TextInputType.number;
  }

  return Container(
    padding: EdgeInsets.all(valorPadding),
      child: TextFormField(
        keyboardType: teclado,
        controller: controle,
        decoration: InputDecoration(
          labelText: texto,
        ),
      ),
  );
}

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

//RadioGroup( "Modelo Florestal", modeloFlorestal )
class RadioGroup extends StatefulWidget {
  String nomeGrupo;
  List<String> lista;
  int posInicial;

  RadioGroup( String _nomeGrupo, List<String> _lista, int _posInicial ){
    this.nomeGrupo = _nomeGrupo;
    this.lista = _lista;
    this.posInicial = _posInicial;
  }

  @override
  _RadioGroupState createState() => _RadioGroupState( nomeGrupo, lista, posInicial);
}

class _RadioGroupState extends State<RadioGroup> {
  String nomeGrupo;
  List<String> lista;
  int posInicial;

  _RadioGroupState( String _nomeGrupo, List<String> _lista, int _posInicial ){
    this.nomeGrupo = _nomeGrupo;
    this.lista = _lista;
    this.posInicial = _posInicial;
  }

  @override
  Widget build(BuildContext context) {
    int radioGrupo = posInicial;

    return Container(
      padding: EdgeInsets.all( valorPadding ),
      margin: EdgeInsets.all( valorPadding ),
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

