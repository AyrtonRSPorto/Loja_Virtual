import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loja_virtual/Modelos/item_carrinho.dart';
import 'package:loja_virtual/Modelos/movel.dart';
import 'package:loja_virtual/Widgets/texto_detalhes.dart';

import '../main.dart';

class CardDetalhes extends StatelessWidget{
  final formaracaoReais = NumberFormat.currency(locale: 'pt_BR',symbol: 'R\$');

  final Movel movel;
  final Function atualizaPagina;

  CardDetalhes({this.movel,this.atualizaPagina});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextoDetalhes(texto: movel.titulo, estilo: Theme.of(context).textTheme.headline1),
          TextoDetalhes(texto: movel.descricao),
          Container(
            margin: EdgeInsets.only(left:16,right: 16,top: 16,bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formaracaoReais.format(movel.preco),style: Theme.of(context).textTheme.headline1,),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    _verificarListaItemCarrinho(
                        Inicio.itensCarrinho,
                        ItemCarrinho(movel: movel, quantidade: 1)
                    );
                  },
                  child: Text('Comprar',style: TextStyle(color: Colors.white),),
                )
            ],
            ),
          )
        ],
      ),
    );
  }
  void _adicionarItemCarrinho(item){
    Inicio.itensCarrinho.add(item);
    atualizaPagina();
  }

  void _verificarListaItemCarrinho(List<ItemCarrinho> lista, ItemCarrinho item){
    int indeceMovel = lista.indexWhere((item) => item.movel == movel);
    if(indeceMovel >=0){
      lista[indeceMovel].quantidade = lista[indeceMovel].quantidade +1;
    } else{
      _adicionarItemCarrinho(item);
    }
  }

}