// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Details extends StatefulWidget {
  //const Details({Key? key}) : super(key: key);
 String title='';
String details='';
String timer='';
  Details({required this.title, required this.details, required this.timer});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _details=TextEditingController();
@override

  
Future _addtask()async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  final User? user= await _auth.currentUser;
  String uid= user!.uid;
  var time =DateTime.now();
  await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytask').doc(widget.timer).set({
    'title': _titlecontroller.text,
    'details':_details.text,
    'time': widget.timer ,
    'timestamp':time,

  });
Fluttertoast.showToast(msg: 'Task Added');

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Details'),


),

body:  Container(
  child: Column(
    children: [
      Container(
        child: TextField(
        controller: _titlecontroller,
        decoration: InputDecoration(
         hintText: widget.title, 
        ),

        ),
      ),
      
      SizedBox(height: 20),
      
      Container(
        child: TextField(
        controller: _details,
        decoration: InputDecoration(
         hintText:widget.details, 
        ),

        ),
      ),


      SizedBox(height: 14),

      ElevatedButton(
              onPressed: ()async {
                _addtask();
              },
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState>states){
                  if(states.contains(MaterialState.pressed)){
                    return Colors.purple.shade300;
                  }
                  else{
                    return Theme.of(context).primaryColor;
                  }
                })
              ),
              child: Text('Done'),

            ),

    ],
  ),
),
    );
  }
}


 








