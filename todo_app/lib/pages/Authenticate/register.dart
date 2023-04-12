// ignore_for_file: sort_child_properties_last

import "package:flutter/material.dart";
import 'package:todo_app/models/authservices.dart';
import 'package:todo_app/widget/loading.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);
final Function tooglepage;
Register({required this.tooglepage});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _signup=AuthService();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email='';
  String password='';
  String error='';
  bool loading =false;
final _key= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(

      appBar: AppBar(
        title: Text('Crafter'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'TODO Crafter',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Form(
              key: _key,
              //padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextFormField(
                controller: nameController,
                // ignore: prefer_const_constructors
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',


                ),
                validator: (value)=> value!.isEmpty? 'Enter an Email':null,
                onChanged: ((value) {
                  setState(() {
                    email=value;
                  });
                }),
              ),
             SizedBox(height: 12),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                // ignore: prefer_const_constructors
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                validator: (value)=> value!.length<=6? 'Password should be more than 6 characters':null,
                onChanged: ((value) {
                  setState(() {
                    password=value;
                  });
                }),
              ),
                ],
              )
            ),
             
            
            SizedBox(height: 10),
            
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child:  Text('Register'),
                  onPressed: () async {
                    if(_key.currentState!.validate()){
                setState(() {
                  loading=true;
                });
                  dynamic res=await _signup.register(email, password);
                    if(res==null){
                      setState(() {
                        error='Failed to Create your account';
                        //loading=false;
                 });
                }
               }
                  },
                )
                
            ),
            SizedBox(height: 12),
            Text(
                error,
                style: TextStyle( color: Colors.red,fontSize: 14),
              ),
            Row(
              children: <Widget>[
                const Text('Already have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    widget.tooglepage();
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ))
    );
  }
}