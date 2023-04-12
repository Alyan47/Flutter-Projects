// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brew_crew/screen/Home/owner.dart';
import 'package:brew_crew/screen/wrapper.dart';
import 'package:flutter/material.dart';


class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.brown[50],
           appBar: AppBar(
              title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
            

           ),

          body: Container(
          
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assest/coffee_bg.png'),
            fit: BoxFit.cover
            
            )
          ),
          child: Center(
               
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                 width: 150,
                 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assest/R.jpeg'),
                    fit: BoxFit.contain,
                    
          
                    )
                  ),
                  
                ),
               
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Card(
                    color: Colors.brown[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: SizedBox(height: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Center(
                          child: Text("Welcome to Brew Crew",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                    ),
                  )
                  
                  
                ),
                RaisedButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>Owner()));
                },
                   
                   child: Text("Log in as Owner"),
                       color: Colors.brown[400],
                       shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                    ),
                    
                ),
                SizedBox(height: 10,),
                 RaisedButton(onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder:(context)=>Wrappper()));
                 },
                   
                   child: Text("Log in as User"),
                       color: Colors.brown[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                ),
              ],
            ),
          ),
          
          ), 
    );
  }
}