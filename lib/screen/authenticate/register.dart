import 'package:brew_crew/Widgets/app_color.dart';
import 'package:brew_crew/Widgets/theme_button.dart';
import 'package:brew_crew/screen/authenticate/loading.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
final Function tooglepage;

Register({required this.tooglepage});  

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final Authservices _auth = Authservices();
final _key= GlobalKey<FormState>();
bool load=false;

  String email ='';
String password='';
String error='';

  @override
  Widget build(BuildContext context) {
    return load? Loading(): Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 5.0,
        title: Text('Create An Account'),
       actions: <Widget>[
          TextButton.icon(onPressed: () { widget.tooglepage(); }, icon:Icon(Icons.person,color: Colors.white,), label: Text('Sign IN', style: TextStyle(color: Colors.white),))
        ],

      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                'assest/Cof.jpeg',
                fit: BoxFit.cover),
              ),
            ), 
            Container(
              padding: EdgeInsets.all(7),
              child: Center(
                child: Column(
                  children: [
                    Form(
          key: _key,
          child: Center(
              
              child: Column(
  
                children: <Widget>[
                  SizedBox(height: 30),

                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email: ',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.black,
                      filled: false,
                        
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 50)),
                      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 10)),
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.brown),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(width: 3, color: Colors.brown),
                    borderRadius: BorderRadius.circular(15),
                  ),
                    
                    ),
                    
                    validator: (value) =>  value!.isEmpty? 'Enter an Email':null ,
                    onChanged: ((value) {
                      setState(() => email=value);
                    }
                    
                  ),
                  
                  ),
                  
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Password: ',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.black,
                      filled: false,
                     // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2)),
                      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2)),
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.brown),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.brown),
                    borderRadius: BorderRadius.circular(15),
                  ),
                    
                    
                    ),
                    
                    validator: (value) => value!.length<=6? 'Password should be more than 6 characters':null,
                    obscureText: true,
                    onChanged: ((value) {
                      setState(()=> password=value);
                    } 
                  )
                  ),
                  SizedBox(height: 20),
                 // ElevatedButton(onPressed: () {},child: Text('Register'),)
                  ThemeButton(
                      label: 'Register',
                      highlight: AppColors.Dark_coffee,
                      color: AppColors.Coffee,
                      onClick: () 
        async 
             
             { 
             if(_key.currentState!.validate()){
              setState(() {
                load=true;
              });
                dynamic res=await _auth.register(email, password);
                if(res==null){
                 setState(() {
                   error='Please Enter a valid Email';
                   load=false;
                 });
                }
             }

        
              
               },
                    
                      
                    ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle( color: Colors.red,fontSize: 14),
              )
            ],
          ),
          
           ),
      ),
          ]) ) )  ] )) ); 
  }
}