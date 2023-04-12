// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:airnb/models/places.dart';

class Place extends StatelessWidget {
  final Places p;
  const Place(this.p,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0)),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset('${p.img}'),

            ),
            Text(
              '${p.title}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.9),
              ),

            )
          ],
        ),
      );
  }
}

class PlaceList extends StatelessWidget {
  const PlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
     child: SizedBox(
      height: 2000,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: place.length,
        itemBuilder: (context,index) {
          return Place(place[index]);
        },
      ),
     ),
    );
    
  } 
}