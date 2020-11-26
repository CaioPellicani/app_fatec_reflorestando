import 'package:cloud_firestore/cloud_firestore.dart';
import 'arvore.dart';

class ProjetoReflorestamento{
  String _nomeProjeto;
  String _bioma;
  String _app;
  String _modeloFloretal;
  String _percentArido;
  String _percentUmido;
  String _percentMisto;
  String _areaTotal;
  String _distanciaCovas;

  List<Arvore> _listaArvores = [];
  String _idArvores;

  set setNomeProjeto( nomeProjeto ) => _nomeProjeto = nomeProjeto;
  set setBioma( bioma ) => _bioma = bioma;
  set setApp( app ) => _app = app;
  set setArido( percentArido ) => _percentArido = percentArido;
  set setUmido( percentUmido ) => _percentUmido = percentUmido;  
  set setMisto( percentMisto ) => _percentMisto = percentMisto;
  set setArea( areaTotal ) => _areaTotal = areaTotal;
  set setDistancia( distanciaCovas ) => _distanciaCovas = distanciaCovas;
  set setModeloFlorestal( modeloFloretal ) => _modeloFloretal = modeloFloretal;
  set setListaArvores( listaArvores ) => _listaArvores = listaArvores;  

  void finalizarProjeto(){

  FirebaseFirestore.instance.collection("projetos").add(
      {
        "nomeProjeto":_nomeProjeto,
        "bioma":_bioma,
        "app":_app,
        "modeloFloretal":_modeloFloretal,
        "percentArido":_percentArido,
        "percentUmido":_percentUmido,
        "percentMisto":_percentMisto,
        "areaTotal":_areaTotal,
        "distanciaCovas":_distanciaCovas,
        "listaEspecies": this.carregarEspecies(),
      }
    );
  }

  String carregarEspecies(){
    return _listaArvores.map( (e) => e.id ).toString();
  }

  void subirDB(){
    _addEspecie('Paricá', 'Schizolobium amazonicum', 'Primária');
    _addEspecie('Ipê-Amarelo', 'Handroanthus serratifolius', 'Secundária');
    _addEspecie('Copaíba', 'Copaifera glycycarpa', 'Climax');
    _addEspecie('Seringueira', 'Hevea brasiliensis', 'Secundária');
    _addEspecie('Tucumã', 'Astrocaryum aculeatum', 'Secundária');
  }

  void _addEspecie(nomePopular, nomeCientifico, funcaoEcologica ){
    var db = FirebaseFirestore.instance.collection("arvores");

    db.add(
      {
        'nomeCientifico':nomePopular,
        'nomePopular':nomeCientifico,
        'funcaoEcologica':funcaoEcologica,
        'checkbox':false,
      }
    );
  }
}