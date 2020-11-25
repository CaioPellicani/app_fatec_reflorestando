import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario{
  String _usuario;
  String _senha;
  var db = FirebaseFirestore.instance.collection("usuarios");

  get usuario => this._usuario;
  get senha => this._senha;

  void query( String usuarioDigitado ){
    db.where( "usuario", isEqualTo: usuarioDigitado )
      .get()
      .then( ( dados ) {
        print( dados.size );
        _usuario = dados.docs.elementAt( 0 ).data()["usuario"].toString();
        this._senha = dados.docs.elementAt( 0 ).data()["senha"].toString();
        print( _senha );
            print( "teste senha interno " + this.testeSenha().toString() );
      }
    );

  }

  bool testeSenha(){
    if( this._senha == "123" )
      return true;
    return false;
  }




}