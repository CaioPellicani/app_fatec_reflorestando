import 'arvore.dart';
class ProjetoReflorestamento{

/*  String _nomeProjeto;
  String _bioma;
  bool _margemDeRio;
  bool _topoDeMorro;
  double _percentDeclividade;
  double _percentArido;
  double _percentUmido;
  double _percentMisto;
  double _areaTotal;
  double _distanciaCovas;
*/

  List<Arvore> listaArvores = [];

  void _addEspecie(String nomePopular, String nomeCientifico, String funcaoEcologica){
    listaArvores.add( 
      Arvore(
        nomeCientifico: nomeCientifico,
        nomePopular: nomePopular,
        funcaoEcologica: funcaoEcologica,
      ) 
    );
  }

  void carregarEspecies(){
    _addEspecie('Paricá', 'Schizolobium amazonicum', 'Primária');
    _addEspecie('Ipê-Amarelo', 'Handroanthus serratifolius', 'Secundária');
    _addEspecie('Copaíba', 'Copaifera glycycarpa', 'Climax');
    _addEspecie('Seringueira', 'Hevea brasiliensis', 'Secundária');
    _addEspecie('Tucumã', 'Astrocaryum aculeatum', 'Secundária');
  }
  get especiesLenght => listaArvores.length; 

  bool checkBoxState( int i ) => listaArvores[i].checkBoxState;  

  void setCheckBox( int i, bool checkBox ) => listaArvores[i].setCheckBoxState = checkBox;

  String nomePopular( int i ) => listaArvores[i].nomePopular;   

  String nomeCientifico( int i ) => listaArvores[i].nomeCientifico;

  String funcaoEcologica( int i ) => listaArvores[i].funcaoEcologica; 
}