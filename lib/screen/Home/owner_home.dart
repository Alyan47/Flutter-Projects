import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screen/Home/update_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/screen/Home/brew_list.dart';
class Home1 extends StatelessWidget {
  
  final Authservices _SignOut=Authservices();
  

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Brew>?>.value(
      initialData:null,
      value: data(uid: '').brews,
      //  catchError: (_, __) => null,
      child: Scaffold(
        //backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[600],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              
            onPressed: ()async{
                await _SignOut.signout1();
            },
             icon: Icon(Icons.person,color:Colors.black,), 
            label: Text('Logout',style: TextStyle(color: Colors.black),)
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assest/beans1.jpeg'),
            fit: BoxFit.cover
            
            )
          ),
          child: BrewList()
          
          ),

      ),
    );
  }
}