// ignore_for_file: prefer_const_constructors

import 'package:brew_crew/screen/Home/option.dart';
import 'package:brew_crew/screen/Home/welcome_page.dart';
import 'package:brew_crew/screen/authenticate/register.dart';
import 'package:brew_crew/screen/authenticate/signIN.dart';
import 'package:brew_crew/screen/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';
//import 'package:splashscreen/splashscreen.dart';
// void main() =>runApp( MyApp());

Future <void> main()async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      value: Authservices().user1,
         initialData: null,
          catchError: (_, __) => null,
      child: MaterialApp(
 
  home: WelcomePage(),
	//debugShowCheckedModeBanner: false,
      
        
      ),
    );
  }
}

// class Splash2 extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return SplashScreen(
// 	seconds: 6,
// 	navigateAfterSeconds: new Option(),
// 	title: new Text('Brew Crew',textScaleFactor: 2,),
// 	image: new Image.asset('assest/R.jpeg'),
// 	loadingText: Text("Loading"),
// 	photoSize: 100.0,
// 	loaderColor: Colors.brown[500],
// 	);
// }
// }