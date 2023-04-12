// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:airnb/widget/cities_widget.dart';
import 'package:airnb/widget/header.dart';
import 'package:airnb/widget/hero_banner.dart';
import 'package:airnb/widget/place.dart';
import 'package:airnb/widget/search_input.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:airnb/widget/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    ScrollController scrollController=ScrollController();
  double scrollControlleroffset=0.0;

   void scrollListner(){
    setState(() {
      scrollControlleroffset=scrollController.offset;
    });
  }

@override
  void initState() {
    
    scrollController=ScrollController();
    scrollController.addListener(scrollListner) ;
super.initState();
  }
   
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers:<Widget> [
              HeroBanner(),
              Header('Explore Nearby'),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              CitiesGrid(),
              Header('Live Anywhere'),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              PlaceList(),
              
            ],
          ),
          FadeAppBar(scrolloffset: scrollControlleroffset),
        ],
      ),
    );
  }
}