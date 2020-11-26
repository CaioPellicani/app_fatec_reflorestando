class Usuario{
  String _usuario;
  String _senha;
  
  Usuario( this._usuario, this._senha );

  Usuario.fromMap( Map< String, dynamic > map ){
    this._usuario = map["usuario"];
    this._senha = map["senha"];
  }


  get usuario => this._usuario;
  get senha => this._senha;
}