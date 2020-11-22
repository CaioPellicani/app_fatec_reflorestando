import 'package:flutter/material.dart';

class Arvore {
  String _nomePopular;
  String _nomeCientifico;
  String _funcaoEcologica;
  bool _checkBoxState;

  Arvore({ nomeCientifico, nomePopular, funcaoEcologica }){
    this._nomeCientifico = nomeCientifico;
    this._nomePopular = nomePopular;
    this._funcaoEcologica = funcaoEcologica; 
    this._checkBoxState = true;
  }

  get nomePopular => this._nomePopular;

  get nomeCientifico => this._nomeCientifico;

  get funcaoEcologica => this._funcaoEcologica;

  set setCheckBoxState( bool checkBoxState ) => this._checkBoxState = checkBoxState;
  get checkBoxState => this._checkBoxState;




}