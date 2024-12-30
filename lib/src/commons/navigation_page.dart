import 'package:flutter/material.dart';

class NavigationPage {

  static changePage(BuildContext context, Widget route){
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }
}