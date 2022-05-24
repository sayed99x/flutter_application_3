// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Readings with ChangeNotifier{
  final String Hp;
  final String SpO2;
  final String ecg;
  final String preasure;
  final String temp;
  Readings({
     required this.Hp,
     required this.SpO2,
     required this.ecg,
     required this.preasure ,
     required this.temp,
  });
}
