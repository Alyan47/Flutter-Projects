import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/pages/Authenticate/register.dart';
import 'package:todo_app/pages/Authenticate/sigin.dart';

class Authenticate extends StatefulWidget {
  //const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
bool showsigin=true;
void tooglepage(){
  setState(() {
    showsigin = !showsigin;
  });
}
  
  @override
  Widget build(BuildContext context) {
    if(showsigin==true){
      return Sigin(tooglepage: tooglepage);
    }
    else{
      return Register(tooglepage: tooglepage);
    }
  }
}