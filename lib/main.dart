import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sectiontask/screens/drlist.dart';
void main(){
runApp(
  MaterialApp(
  home: drlist(),
  theme: ThemeData(
    primaryColor: Color(0xff07da5f)
  ),
),
);
}