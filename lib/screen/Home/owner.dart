import 'package:brew_crew/screen/Home/home.dart';
import 'package:brew_crew/screen/Home/owner_home.dart';
import 'package:brew_crew/screen/authenticate/auth1.dart';
import 'package:brew_crew/screen/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/models/user.dart';
import 'package:provider/provider.dart';

class Owner extends StatelessWidget {
 

  @override
  Widget build (BuildContext context) {
    //either return Home or authenticate widget
    final user=Provider.of<TheUser?>(context);
    if(user==null){
      return Auth1();
    }
    else{
      return Home1();
    }
  }
}