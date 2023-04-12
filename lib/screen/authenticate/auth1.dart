import 'package:brew_crew/screen/authenticate/register.dart';
import 'package:brew_crew/screen/authenticate/sigin_owner.dart';
import 'package:brew_crew/screen/authenticate/signIN.dart';
import 'package:flutter/material.dart';

class Auth1 extends StatefulWidget {
  const Auth1({Key? key}) : super(key: key);

  @override
  State<Auth1> createState() => _Auth1State();
}

class _Auth1State extends State<Auth1> {
  @override
  Widget build(BuildContext context) {
    return  Sigin1();
  }
}