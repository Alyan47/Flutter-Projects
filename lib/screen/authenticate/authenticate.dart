import 'package:brew_crew/screen/authenticate/register.dart';
import 'package:brew_crew/screen/authenticate/signIN.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {


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
      return SignIn(tooglepage:tooglepage);
    }
    else{
      return Register(tooglepage:tooglepage);
    }
  }
}