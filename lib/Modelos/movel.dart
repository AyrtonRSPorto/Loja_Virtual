
class Movel {
  String titulo;
  String foto;
  String descricao;
  int preco;

  Movel({
    this.titulo,
    this.descricao,
    this.foto,
    this.preco
   });
  Movel.fromJson(Map<String, dynamic> json){
    titulo = json['titulo'];
    descricao = json['descricao'];
    foto = json['foto'];
    preco = json['preco'];
  }
}