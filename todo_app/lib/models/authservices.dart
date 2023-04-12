// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/database.dart';
import 'package:todo_app/models/user.dart';


class AuthService {
final FirebaseAuth auth = FirebaseAuth.instance;

TheUser? _userfromfirebase(User u) {
  return u!=null? TheUser(uid: u.uid): null;

}

//Stream
Stream <TheUser?> get stream {
 return auth.authStateChanges().
 map((User? u) => _userfromfirebase(u!));

}

// sigin as guest
Future sigin_asguest() async{
  try {
    UserCredential res= await auth.signInAnonymously();
    User? u= res.user;
    return _userfromfirebase(u!);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

//sigin with email and password

Future sigin (String email,String password) async {

  try {
    UserCredential res= await auth.signInWithEmailAndPassword(email: email, password: password);
    User? u=res.user;
return _userfromfirebase(u!);


  } catch (e) {
    print(e.toString());
    return null;
  }
}

// register with email and password

Future register (String email,String password) async {
  try {
    UserCredential res= await auth.createUserWithEmailAndPassword(email: email, password: password);
    User? u=res.user;
    await Database(uid: u!.uid).data(email, password);
    return _userfromfirebase(u!);

  } catch (e) {
    print(e.toString());
    return null;


  }
}

// Signout 
Future signout1()async{
  try {
    return await auth.signOut(); 


  } catch (e) {
    print(e.toString());
    return null;
  }
}

}