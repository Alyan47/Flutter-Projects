// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:airnb/models/city.dart';

class CityCard extends StatelessWidget {
  
final City city;
const CityCard(this.city,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('images/${city.image}', width:59),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${city.title}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,

                ),
              ),

                 Text(
                '${city.sub_title}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,

                ),
              ),
            ],
          ),
        )
      ],
      ),
      elevation: 0,
    );
  }
}

class CitiesGrid extends StatelessWidget {
  const CitiesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
        return SliverGrid(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.5/1,
           ), 
           delegate: SliverChildBuilderDelegate(
            (BuildContext context,int index){
              return CityCard(cities[index]);
            },
            childCount: cities.length,
           ), 
           
        );
    

  }
}