// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_field, prefer_final_fields, unused_element, unused_local_variable, no_leading_underscores_for_local_identifiers, await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNotes extends StatefulWidget {
  //const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _details=TextEditingController();

 Future _addtask()async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  final User? user= await _auth.currentUser;
  String uid= user!.uid;
  var time =DateTime.now();
  await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytask').doc(time.toString()).set({
    'title': _titlecontroller.text,
    'details':_details.text,
    'time': time.toString(),
    'timestamp':time,

  });
Fluttertoast.showToast(msg: 'Task Added');

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget> [
            Container(
              child: TextField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  labelText: 'Title',
                  //border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0)),
                ),
              ),
            ),
            SizedBox(height: 12),

            Container(
              child: TextField(
                controller: _details,
                decoration: InputDecoration(
                  labelText: 'Details',
                  //border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0)),
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
              child: Text('Add Task'),

            ),
          ],
        ),
      ),
    );
  }
}