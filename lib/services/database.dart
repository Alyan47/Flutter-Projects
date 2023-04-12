import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/user.dart';

class data {
  final String uid;

  data({required this.uid});
 // Collection of Data
final CollectionReference brewcollection=FirebaseFirestore.instance.collection('brew');

//update user data
Future updatedata(String name,String suger,int strength) async{

return await brewcollection.doc(uid).set({
'name': name,
'suger':suger,
'strength':strength

});

}
// brew list from snapshot
List<Brew> _brewlistfromsnapshot(QuerySnapshot snapshot){
return snapshot.docs.map((doc){
return Brew(name: doc.get('name')?? '', suger:doc.get('suger')?? '0 ' , strength: doc.get('strength')?? 0);
}).toList();
}

// USer data fram snapshot

UserData _userDatafromsanapshot(DocumentSnapshot snapshot ) {
return UserData(
  uid: uid,
  name: snapshot.get('name'),
  suger: snapshot.get('suger'),
  strength: snapshot.get('strength'),

);
}
Stream <List<Brew>> get brews {
return brewcollection.snapshots().map((QuerySnapshot snapshot) => (_brewlistfromsnapshot(snapshot)));
 
}
 // get user doc stream (import user data in update user form)
 Stream<UserData> get Userdata {
  return brewcollection.doc(uid).snapshots().map((DocumentSnapshot snapshot) => (_userDatafromsanapshot(snapshot)));

 }
}