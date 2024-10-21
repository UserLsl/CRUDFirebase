import 'dart:async';

import 'package:crud/model/livro.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaLivros extends StatefulWidget {
  const ListaLivros({super.key});

  @override
  State<ListaLivros> createState() => _ListaLivrosState();
}

class _ListaLivrosState extends State<ListaLivros> {

  late List<Livro> items;
  var db = FirebaseFirestore.instance;
  
  StreamSubscription<QuerySnapshot>? livroInscricao;

  @override
  void initState() {
    super.initState();

    items = [];
    livroInscricao?.cancel();

      // db.collection("produtos").snapshots().listen((resultado4) {
  //   resultado4.docs.forEach((d) {
  //     print(d.data());
  //   });
  // });

    livroInscricao = db.collection("livros").snapshots().listen((snapshot) {
          // snapshot.docs.forEach((d) {
          //   print(d.data());
          // });
      final List<Livro> livros = snapshot.docs.map(
        (documentSnapshot) => Livro.fromMap(documentSnapshot.data(), documentSnapshot.id), 
      ).toList();

      setState(() {
        items = livros;
      });
    });
  }

  @override
  void dispose() {
    livroInscricao?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros2'),
        centerTitle: true,
      ),
      body: ListaProdutos(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: const Icon(Icons.add)
      ),
    );
  }

  Column ListaProdutos() {
    return Column(
      children: [
        Expanded(child: StreamBuilder<QuerySnapshot>(
          stream: getListaProdutos(), 
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting: return const Center(child: CircularProgressIndicator());
              default: List<DocumentSnapshot> documentos = snapshot.data!.docs.cast<DocumentSnapshot<Object?>>();
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index].titulo ?? '',
                    style: const TextStyle(fontSize: 22))
                  );
                },
              );
            }
          }
        ),
        ),
      ],
    );
  }

  Stream<QuerySnapshot> getListaProdutos() {
    return FirebaseFirestore.instance.collection('livros').snapshots();
  }
}