import 'package:flutter/material.dart';
import '../models/constant.dart';

class UserReadings extends StatelessWidget {
  final String Hp;
  final String SpO2;
  final String ecg;
  final String preasure;
  final String temp;
  UserReadings(this.Hp, this.SpO2, this.ecg, this.preasure, this.temp);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'HP',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  Hp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'SpO2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  SpO2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'ecg',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  ecg,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'Preasure',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  preasure,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'Temp',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  temp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
