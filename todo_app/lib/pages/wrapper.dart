// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/pages/Authenticate/authenticate.dart';
import 'package:todo_app/pages/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<TheUser?>(context);
    if(user==null){
      return Authenticate();
    }

    else {
      return Home();
    }
  }
}