import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screen/Home/brew_tile.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {


  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews=Provider.of<List<Brew>?>(context)??[];
  //print(brews.docs);
  // if(brews!=null){

  
// for (var doc in brews.docs) {
//   print(doc.data());
  
// }
//   }
// if (brews!=null) {

// brews.forEach((brew) {
  
//     print(brew.name);
  
//   print(brew.suger);
//   print(brew.strength);

// });
// }

    return ListView.builder(
     itemCount: brews.length,
     itemBuilder: (context,index){
     return BrewTile(brew: brews[index] );
     },
    );
  }
}
  