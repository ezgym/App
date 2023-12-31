import 'package:ezgym/screens/routine_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/routine.dart';
import '../services/routineApi.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Routine> rutinas = [];

  @override
  void initState() {
    super.initState();
    fetchRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white
      ),
      body: Column(
        children: [const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("Tus rutinas favoritas", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
        ),
          ListView.builder(
            itemCount: rutinas.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final rutina = rutinas[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(rutina.image.toString()),
                ),
                title: Text("${rutina.name}"),
                subtitle: Text("${rutina.difficulty}"),
                trailing: const Icon(CupertinoIcons.heart_fill, color: Colors.red),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutineDetails(rutina: rutina),
                    ),
                  );
                },
              );
            },
          ),
        ],
      )
    );
  }

  Future<void> fetchRoutines() async{
    final response = await RoutineApi.fetchRoutines();
    setState(() {
      rutinas = response;
    });
  }
}
