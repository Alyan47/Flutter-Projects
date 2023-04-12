import 'package:brew_crew/Widgets/app_color.dart';
import 'package:brew_crew/Widgets/theme_button.dart';
import 'package:brew_crew/screen/authenticate/loading.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
final Function tooglepage;

SignIn({required this.tooglepage});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final Authservices _signin=Authservices(); 
final _key= GlobalKey<FormState>();
bool loading=false;

String Error="";
String email ='';
String password='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 5.0,
        title: Text('Sign IN to Brew Crew'),
       actions: <Widget>[
        TextButton.icon(onPressed: () { widget.tooglepage();}, icon:Icon(Icons.app_registration,color: Colors.white,), label: Text('Sign Up', style: TextStyle(color: Colors.white),))
        ]
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
                      label: 'Sign In',
                      highlight: AppColors.Dark_coffee,
                      color: AppColors.Coffee,
                      onClick: () async{ 
                 if(_key.currentState!.validate()){
                  setState(() {
                    loading=true;
                  });
                    dynamic res=await _signin.signin(email, password);
                      if(res==null){
                        setState(() {
                          Error='Failed to Sig In';
                          loading=false;
                   });
                  }
                 }

               },
                    
                      
                    ),
                 SizedBox(height: 12),
                  Text(
                    Error,
                    style: TextStyle( color: Colors.white,fontSize: 14),
                  )
                ],
              ),
          ),
          
           ),
      
                  ],
                
                ),
              ),
            )
          ],
        )
      )
    );
  }
}