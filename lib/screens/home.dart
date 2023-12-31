// ignore_for_file: prefer_const_constructors

//import 'package:ezgym/services/routineApi.dart';
import 'package:ezgym/widgets/favs.dart';
import 'package:ezgym/widgets/latest.dart';
import 'package:flutter/material.dart';

import '../models/routine.dart';
import '../widgets/recommended.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Routine> rutinas = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EzGym', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black)
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: const Column(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('¡Bienvenido Usuario!', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                children: [
                  Text("Recomendaciones")
                ],
                ),
                Recommended(),
                Row(
                  children: [
                    Text("Ultimos agregados")
                  ],
                ),
                Latest(),
                Row(
                  children: [
                    Text("Rutinas favoritas")
                  ],
                ),
                Favs()
            ],
          ),
        ),
      ),
    );
  }

}
