import 'package:flutter/material.dart';

class SettingTile {
  String title;
  IconData icon;
  Color iconColor;
  Function onTap;

  SettingTile(this.title, this.icon, this.iconColor, this.onTap);
}
