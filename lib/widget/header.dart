// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;
  const Header( this.text,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 15),
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.9),
            
            
          ),

        ),
        

      )
      
      
    );
  }
}