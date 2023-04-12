import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screen/authenticate/loading.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screen/comst_screen.dart';
import 'package:provider/provider.dart';
class UpdateForm extends StatefulWidget {
 

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
final _formkey= GlobalKey<FormState>();
final List <String> suger=['0','1','2','3','4'];

String _currentName='';
String? _currentsuger;
int? _currentstrength;

  @override
  Widget build(BuildContext context) {
        final user=Provider.of<TheUser?>(context);
return StreamBuilder<UserData>(
  stream: data(uid:user!.uid ).Userdata,

  builder: (context, snapshot) {

    
    if (snapshot.hasData) {
        UserData? userData=snapshot.data;

        return     Form(
    
      key: _formkey,
    
      child: SingleChildScrollView(
    
        child: Column(
    
          children: <Widget>[
    
            Text('Update your Coffee',style: TextStyle(fontSize: 18),),
    
              SizedBox(height: 20),
    
              TextFormField(
    
                decoration: customdecoration.copyWith(hintText: userData?.name),
    
                validator:(val)=>val!.isEmpty? 'Enter name': null,
    
                onChanged: (val)=> setState(() {
    
                  _currentName=val;
    
                }),
    
              ),
    
              SizedBox(height: 20),
    
    
    
              //dropdown
    
              DropdownButtonFormField<String>(
    
                decoration: customdecoration,
    
                value: _currentsuger?? userData?.suger,
    
                items: suger.map((suger) {
    
              
    
                return DropdownMenuItem(
    
                  
    
                  value:suger,
    
                  child: Text('$suger sugers'),
    
                ) ;
    
              }).toList(), 
    
              onChanged: (val)=> setState(()=>_currentsuger=val)
    
              
    
              ),
    
        
    
              //Slider
    
              Slider(
    
               value: (_currentstrength?? userData?.strength)!.toDouble(),
    
               activeColor: Colors.brown[_currentstrength??userData!.strength],
    
               inactiveColor: Colors.brown[_currentstrength??userData!.strength],
    
                min:100.0,
    
                max:900.0,
    
                divisions: 8,
    
                onChanged: (val)=> setState(() => _currentstrength=val.round()),
    
              ),
    
    
    
             RaisedButton(onPressed:() async{ 
    
              if(_formkey.currentState!.validate()){
    
                  await data(uid: user.uid).updatedata(
                  _currentName ?? userData!.name,
                  _currentsuger ?? userData!.suger,
                  _currentstrength ?? userData!.strength,

                  );
                  Navigator.pop(context);
    

               }
    
      
    
                   },
    
                   color: Colors.brown[400],
    
                    child: Text('Update'),
    
                    ),
    
          ],
    
        ),
    
      ),
    
    );
    } else {
      return Loading();
    }
  
  }
);
  }
}
