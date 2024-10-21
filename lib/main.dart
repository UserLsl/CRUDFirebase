import 'package:crud/lista_livros.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:crud/firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //var db = FirebaseFirestore.instance;

  //Para criar um novo registro
  // db.collection("livros")
  //   .add(
  //     {
  //       "nome":"Sob a redoma",
  //       "autor":"Stephen King",
  //       "preco":24.5,
  //       "ativo":true
  //     }
  //   );

  //Para atualizar um registro
  // db.collection("produtos")
  //   .doc("5prq5Ym6u1Qrvi1KzMSE")
  //   .set(
  //     {
  //       "nome":"lápis",
  //       "preco":2.50,
  //       "ativo":true
  //     }
  //   );

  //Para atualizar somente um campo do registro
  // db.collection("produtos")
  //   .doc("5prq5Ym6u1Qrvi1KzMSE")
  //   .update(
  //     {
  //       "ativo":false
  //     }
  //   );

  //Para consultar todos os registros
  // QuerySnapshot resultado = await db.collection("produtos").get();
  // resultado.docs.forEach((d) {
  //   print(d.id);
  //   print(d.data());
  // });

  //Para atualizar todos os registros
  // QuerySnapshot resultado2 = await db.collection("produtos").get();
  // resultado2.docs.forEach((d) {
  //   d.reference.update(
  //     {
  //       "ativo": false
  //     }
  //   );
  // });

  //Consultar um registro especifico
  // DocumentSnapshot resultado3 = await db.collection("produtos").doc("5prq5Ym6u1Qrvi1KzMSE").get();
  // print(resultado3.id);
  // print(resultado3.data());

  //Para excluir um registro
  // await db.collection("produtos").doc("wa5fdaGJdMUAuRBMptOf").delete();

  //Para receber atualizações quando algum campo for alterado
  // db.collection("produtos").snapshots().listen((resultado4) {
  //   resultado4.docs.forEach((d) {
  //     print(d.data());
  //   });
  // });


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Biblioteca',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: const ListaLivros(),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Row(children: [
//           Text("flutter2")
//         ],),
//       ),
//       body: Container(
//           child: const Column(
//             children: [

//             ],
//           ),
//         )
//     );
//   }
// }