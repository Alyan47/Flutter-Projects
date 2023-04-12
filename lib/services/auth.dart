import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservices{

final FirebaseAuth _auth = FirebaseAuth.instance;

// creating Theuser obj besed of user
TheUser? _uf(User u){
  return u !=null ? TheUser(uid: u.uid):null;
}

// auth cahnge user stream
Stream<TheUser?> get user1{
  return _auth.authStateChanges().
  map((User? user) => _uf(user!) );


}

// sign in anon (as a guest)
Future signinanon() async {
  try {
   UserCredential result= await _auth.signInAnonymously();
   User? user = result.user;
   return _uf(user!);
  } catch (e) {
    print(e.toString());
    return null;
  }
}
// sign in with email and pass
Future signin(String e,String pass) async{  //e=email pass=password//
  try {
    UserCredential res=await _auth.signInWithEmailAndPassword(email:e, password: pass);
    User? u= res.user;
    return _uf(u!);
  } catch (e) {
    print(e.toString());
    return null;
  }
}
// register with eamil and pass
Future register(String email,String pass) async{
try {
  UserCredential res=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
  User? u =res.user;
  // create a documebt in database with above user id (uid);
  await data(uid: u!.uid).updatedata('New member','0',100);
  return _uf(u);


} catch (e) {
  print(e.toString());
  return null;
}
}
// sign out
Future signout1()async{
  try {
    return await _auth.signOut(); 


  } catch (e) {
    print(e.toString());
    return null;
  }
}

}