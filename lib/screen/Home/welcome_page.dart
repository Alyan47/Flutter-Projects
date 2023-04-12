import 'package:brew_crew/screen/Home/owner.dart';
import 'package:brew_crew/screen/wrapper.dart';
import 'package:flutter/material.dart';
import "package:brew_crew/Widgets/iconfont.dart";
import 'package:provider/provider.dart';
import "package:brew_crew/Widgets/icon_helper.dart";
import 'package:brew_crew/Widgets/app_color.dart';
import 'package:brew_crew/Widgets/theme_button.dart';

class WelcomePage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    

    return Scaffold(
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: Colors.brown[1000],
                        alignment: Alignment.center,
                        child: Image.asset(IconFontHelper.MAIN_LOGO,)
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text('Brew Crew',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.brown[300],
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 40),
                  Text('Always There for You',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.brown[100],
                      fontSize: 18
                    )
                  ),
                  SizedBox(height: 40),
                  ThemeButton(
                    label: 'Login as Owner',
                    highlight: AppColors.Coffee,
                    color: AppColors.MAIN_COLOR,
                    onClick: () {
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>Owner()));
                    },
                  ),
                  ThemeButton(
                    label: 'Login as User',
                    highlight: AppColors.Coffee,
                    color: AppColors.MAIN_COLOR,
                    onClick: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Wrappper()));  
                    },
                  ),
                  // ThemeButton(
                  //   label: "Hacer Login",
                  //   labelColor: AppColors.MAIN_COLOR,
                  //   color: Colors.transparent,
                  //   highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                  //   borderColor: AppColors.MAIN_COLOR,
                  //   borderWidth: 4,
                  //   onClick: (){}
                  // )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}