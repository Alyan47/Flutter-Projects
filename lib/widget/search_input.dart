// ignore_for_file: prefer_const_constructors

import 'package:airnb/models/city.dart';
import 'package:flutter/material.dart';
import 'package:airnb/models/places.dart';
class Saearchinput extends StatelessWidget {
  const Saearchinput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          offset: Offset(12, 26),
          spreadRadius: 0,
          blurRadius: 50,
          color: Colors.grey.withOpacity(.1)
        )
        ],
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Where are your going?',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(.75)
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))

          ),
          enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white,width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        ),
        
        controller: TextEditingController(),
      ),
    );
  }
}