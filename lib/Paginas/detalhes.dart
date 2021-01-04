import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/Modelos/movel.dart';
import 'package:loja_virtual/Widgets/appbar_customizada.dart';
import 'package:loja_virtual/Widgets/card_detalhes.dart';

class Detalhes extends StatefulWidget{

  final Movel movel;

  Detalhes({this.movel});

  _DetalhesState createState() => _DetalhesState();

}

class _DetalhesState extends State<Detalhes>{

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('utilidades/assets/imagens/${widget.movel.foto}'),
            fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarCustomizada(
            titulo: '',
            ehPaginaCarrinho: false,
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.all(16),
                height: 220,
                child: CardDetalhes(
                  atualizaPagina: atualiza,
                  movel: widget.movel
                )),
          )
        ),
      );
  }
  atualiza(){
    setState(() {});
  }
}