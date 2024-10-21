class Livro {
  String? _id;
  String? _titulo;
  String? _autor;
  String? _preco;

  Livro(this._id, this._titulo, this._autor, this._preco);

  Livro.map(dynamic obj) {
    _id = obj['id'];
    _titulo = obj['titulo'];
    _autor = obj['autor'];
    _preco = obj['preco'];
  }

  String? get id => _id;
  String? get titulo => _titulo;
  String? get autor => _autor;
  String? get preco => _preco;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['titulo'] = _titulo;
    map['autor'] = _autor;
    map['preco'] = _preco;

    return map;
  }

  Livro.fromMap(Map<String, dynamic> map, String id) {
    _id = id;
    _titulo = map['titulo'];
    _autor = map['autor'];
    _preco = map['preco'];
  }
}