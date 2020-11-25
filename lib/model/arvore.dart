class Arvore {
  String _id;
  String _nomePopular;
  String _nomeCientifico;
  String _funcaoEcologica;
  bool _checkBoxState;

  Arvore(
    this._id, 
    this._nomeCientifico, 
    this._nomePopular, 
    this._funcaoEcologica,
    this._checkBoxState
  );

  Arvore.fromMap( Map< String, dynamic > map, String id){
    this._id = id ?? '';
    this._nomeCientifico = map['nomeCientifico'];
    this._nomePopular = map['nomePopular'];
    this._funcaoEcologica = map['funcaoEcologica'];
    this._checkBoxState = true;
  }
  
  get id => this._id;
  get nomePopular => this._nomePopular;
  get nomeCientifico => this._nomeCientifico;
  get funcaoEcologica => this._funcaoEcologica;
  get checkBoxState => this._checkBoxState;

  set setCheckBoxState( bool checkBoxState ) => this._checkBoxState = checkBoxState;
}