
import 'package:firebase_auth/firebase_auth.dart';

class TheUser{
final String uid;

TheUser({required this.uid});

}

class UserData{
  final String uid;
  final String name;
final String suger;
final int strength;

UserData({required this.uid,required this.name,required this.suger,required this.strength});


}