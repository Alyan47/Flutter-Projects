import 'package:todo_app/models/authservices.dart';
import 'package:todo_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
final String uid;


Database({required this.uid});
 
 final CollectionReference userdata=FirebaseFirestore.instance.collection('UserData');

// function to store user crendetials in database
 Future data(String email,String password)async{
   return await userdata.doc(uid).set({
    'Email':email,
    'Password':password
   });
 }

Stream get task{

 return FirebaseFirestore.instance.collection('task').doc(uid).collection('mytask').doc().snapshots();
}


}