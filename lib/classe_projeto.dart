
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
  List<bool> _checkBox = [];
  List<String> _nomePopular = [];
  List<String> _nomeCientifico = [];
  List<String> _funcaoEcologica = [];
  int _especiesLength = 0;

  void _addEspecie(String nomePopular, String nomeCientifico, String funcaoEcologica){
    this._checkBox.add( true );
    this._nomePopular.add( nomePopular );
    this._nomeCientifico.add( nomeCientifico );
    this._funcaoEcologica.add( funcaoEcologica );
    this._especiesLength++;
  }

  void carregarEspecies(){
    _addEspecie('Paricá', 'Schizolobium amazonicum', 'P');
    _addEspecie('Ipê-Amarelo', 'Handroanthus serratifolius', 'S');
    _addEspecie('Copaíba', 'Copaifera glycycarpa', 'C');
    _addEspecie('Seringueira', 'Hevea brasiliensis', 'S');
    _addEspecie('Tucumã', 'Astrocaryum aculeatum', 'S');
  }

  get getEspeciesLenght{
    return _especiesLength;
  }

  bool getCheckBox( int i ){
    return _checkBox[i];
  }

  void setCheckBox( int i, bool checkBox ){
    this._checkBox[i] = checkBox;
  }

  String getNomePopular( int i ){
    return _nomePopular[i];
  }  

  String getNomeCientifico( int i ){
    return _nomeCientifico[i];
  }  

    String getFuncaoEcologica( int i ){
    return _funcaoEcologica[i];
  }  

  void exportar(){

  }
  
}