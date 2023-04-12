// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height/2.1,
        child: Stack(
          children: [
            Image.asset(
              'images/airbnb_home.JPEG',
              fit: BoxFit.cover,
              height:MediaQuery.of(context).size.height/2.1 ,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Not sure where to go?\n Don\'t worry you are at right place',
                    textAlign: TextAlign.center,
                    style: TextStyle( fontSize: 16, fontWeight:FontWeight.w600 ),
                  ),
                  SizedBox(
                    height: 25
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      elevation: MaterialStateProperty.all(5),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.only(
                          right: 50,left: 50, top: 12.5 ,bottom: 12.5
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        )
                      ),
                      overlayColor: MaterialStateProperty.resolveWith((states){
                        return states.contains(MaterialState.pressed)? Colors.grey.shade100:null;
                      })
                    ), 
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.purple,Colors.pink]).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                        child: Text(
                          'AirBNB',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}