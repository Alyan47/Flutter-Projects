// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:todo_app/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/authservices.dart';
import 'models/user.dart';



Future <void> main()async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
  return StreamProvider<TheUser?>.value(
      value: AuthService().stream,
         initialData: null,
          catchError: (_, __) => null,
      // ignore: prefer_const_constructors
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark,primaryColor: Colors.indigo),
        home: Wrapper(),
      ),
  );

  }
}

