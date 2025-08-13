import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_tech_website/core/utils/app_colors.dart';

class Animationbotton extends ChangeNotifier
{
  bool onhover = false ;
  Color color = AppColors.orange;
  Color textcolor = Colors.white;

  void sethover( bool val )
  {
    onhover = val;
    if (val == true)
    {
      color = Colors.yellow;
      textcolor = Colors.black;
    }else
    {
      color = Colors.orange;
      textcolor = Colors.white;
    }
    notifyListeners();
  }

}