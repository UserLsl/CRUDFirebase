import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/model/livro.dart';
import 'package:flutter/material.dart';

class NovoLivro extends StatefulWidget {

  final Livro livro;
  const NovoLivro(this.livro, {super.key});

  @override
  State<NovoLivro> createState() => _NovoLivroState();
}

class _NovoLivroState extends State<NovoLivro> {

  var db = FirebaseFirestore.instance;

  TextEditingController? _tituloController;
  TextEditingController? _precoController;

  @override
  void initState() {
    super.initState();
    _tituloController = new TextEditingController(text: widget.livro.titulo);
    _precoController = new TextEditingController(text: widget.livro.preco);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edita/Incluí - Livros"), centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(children: [
          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: _precoController,
            decoration: const InputDecoration(labelText: 'Preço'),
          ),
          ElevatedButton(
            onPressed: () {
              if(widget.livro.id != null) {
                db.collection("livros").doc(widget.livro.id).set(
                  {
                    "titulo": _tituloController?.text,
                    "preco": _precoController?.text,
                    "autor": 'nd',
                  }
                );
              } else {
                db.collection("livros").doc(widget.livro.id).set(
                  {
                    "titulo": _tituloController?.text,
                    "preco": _precoController?.text,
                    "autor": 'nd',
                  }
                );
              }
              Navigator.pop(context);
            }, 
            child: widget.livro.id != null ? const Text('Atualiza') : Text('Novo'),
            ) 
        ],),
      ),
    );
  }
}