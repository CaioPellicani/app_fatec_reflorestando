import 'package:flutter/material.dart';
import 'classe_botao.dart';
import 'main.dart';


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
          Botao(label: 'Voltar ao Menu', acao: ()=> Navigator.pushNamed( contexto, "/tela_03" ) ),
          Botao(label: 'Sobre o desenvolvedor', acao: ()=> Navigator.pushNamed( contexto, "/tela_02" ) ),
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