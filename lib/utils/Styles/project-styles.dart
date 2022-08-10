import 'package:flutter/material.dart';

class ProjectStyles {

  static TextStyle checkedItem(bool isCheck) {
    return isCheck
        ? TextStyle(color: Colors.white24)
        : TextStyle(color: Colors.white);
  }

  static Color checkBoxColor = Colors.green;

  static Color? listTileColor = Colors.grey[900];

  static Color? scaffoldColor = Colors.grey[600];

}