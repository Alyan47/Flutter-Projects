// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_final_fields, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/authservices.dart';
import 'package:todo_app/models/database.dart';
import 'package:todo_app/pages/home/Description.dart';
import 'package:todo_app/pages/notes.dart';
import 'package:todo_app/widget/loading.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _SignOut=AuthService();
  FirebaseAuth auth=FirebaseAuth.instance;

 // final Stream<QuerySnapshot> _stream=FirebaseFirestore.instance.collection('tasks').doc(uid).snapshots() as Stream<QuerySnapshot<Object?>>;
  
  String uid='q';
  @override
  void initState() {
  getuid();
    super.initState();
    
  }

    getuid()async{
FirebaseAuth auth=FirebaseAuth.instance;
User? user= await auth.currentUser;
setState(() {
  uid =user!.uid;

});


}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
       backgroundColor: Theme.of(context).primaryColor,
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
      
      body: 
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>
        ( stream:FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytask').snapshots(),

        builder: (context,snapshots){
          if(snapshots.connectionState==ConnectionState.waiting){
            return Center(
               child: Text(
                'Refreshing',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
               ),
            );
          }
          else{
            final doc=snapshots.data?.docs;
            return ListView.builder(itemCount:doc?.length, 
            itemBuilder: (context,index){
              var timestamp=(doc![index]['timestamp'] as Timestamp).toDate();
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Details( 
                    
                    title:doc[index]['title'] , 
                  
                  details: doc[index]['details'],

                  timer: doc[index] ['time'],
                  )
                  
                  )
                  );
                },
                child: Container(
                  //margin:EdgeInsets.only(top: 50),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Color(0xff121211),
                            borderRadius: BorderRadius.circular(10)),
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget> [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                           Container(
                               margin: EdgeInsets.only(left: 20),
                              child: Text(doc[index]['title'],
                                 )
                               ),
                             SizedBox(height: 5),  
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(DateFormat.yMd().add_jm().format(timestamp) )
                              
                              ),
                          ],
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                            ),
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('tasks')
                                  .doc(uid)
                                  .collection('mytask')
                                  .doc(doc[index]['time'])
                                  .delete();
                            },
                            ),
                          ]
                        )
                      ),
              );
                
            },
            
            );
          }
        },
        
        ),

      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => AddNotes())));
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Colors.black,),

      ) ,
    );
  }
}