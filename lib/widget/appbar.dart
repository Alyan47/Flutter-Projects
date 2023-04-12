// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:airnb/widget/search_input.dart';
import 'package:flutter/material.dart';

class FadeAppBar extends StatelessWidget {
  final double scrolloffset;

  FadeAppBar({Key? key, required this.scrolloffset}) : super(key: key);
//FadeAppBar({required this.scrolloffset});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        color: Colors.white.withOpacity((scrolloffset/350).clamp(0, 1).toDouble()),
        child: SafeArea(child: Saearchinput()),
      ),
    );
  }
}