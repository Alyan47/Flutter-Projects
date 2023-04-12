import 'package:flutter/material.dart';
import 'package:brew_crew/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew ;

  BrewTile({required this.brew});


  @override
  Widget build(BuildContext context) {
      
      return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
           //shadowColor: Colors.brown.shade600,
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(radius: 25,backgroundColor: Colors.brown[brew.strength],backgroundImage: AssetImage('assest/coffee_icon.png'),),
            title: Text(brew.name),
            subtitle: Text('Takes  ${brew.suger}  suger(s)'),
          ),
          shape: StadiumBorder(
                side: BorderSide(
                  // border color
                  color: Colors.brown.shade600,
                  // border thickness
                  width: 5,
                ),
              ),
              
        ),
      );
  }
}