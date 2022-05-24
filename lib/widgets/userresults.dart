// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/constant.dart';
import '../providers/patients.dart';

class UserData extends StatelessWidget {
  final Patients userPatient;

  UserData(this.userPatient);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Card(
          color: Colors.blue[100],
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text(userPatient.age),
              ),
            ),
            title: Text(
              userPatient.Name,
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
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Your Results',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: kTitleTextColor,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'HP:',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  userPatient.readings['HP'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'SpO2:',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  userPatient.readings['SpO2'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'temprature:',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  userPatient.readings['temp'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'preasure:',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  userPatient.readings['preesure'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.blue[100],
              elevation: 5,
              child: ListTile(
                leading: FittedBox(
                  child: Text(
                    'ECG:',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  userPatient.readings['ecg'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
      // .map((readings) => Column(children: [
      //       Card(
      //         color: Colors.blue[100],
      //         elevation: 5,
      //         child: ListTile(
      //           leading: FittedBox(
      //             child: Text(
      //               'HP:',
      //               style: TextStyle(
      //                   fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           title: Text(
      //             readings.Hp,
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //               color: kTitleTextColor,
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Card(
      //         color: Colors.blue[100],
      //         elevation: 5,
      //         child: ListTile(
      //           leading: FittedBox(
      //             child: Text(
      //               'SpO2:',
      //               style: TextStyle(
      //                   fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           title: Text(
      //             readings.SpO2,
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //               color: kTitleTextColor,
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Card(
      //         color: Colors.blue[100],
      //         elevation: 5,
      //         child: ListTile(
      //           leading: FittedBox(
      //             child: Text(
      //               'temprature:',
      //               style: TextStyle(
      //                   fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           title: Text(
      //             readings.temp,
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //               color: kTitleTextColor,
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Card(
      //         color: Colors.blue[100],
      //         elevation: 5,
      //         child: ListTile(
      //           leading: FittedBox(
      //             child: Text(
      //               'preasure:',
      //               style: TextStyle(
      //                   fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           title: Text(
      //             readings.preasure,
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //               color: kTitleTextColor,
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Card(
      //         color: Colors.blue[100],
      //         elevation: 5,
      //         child: ListTile(
      //           leading: FittedBox(
      //             child: Text(
      //               'ECG:',
      //               style: TextStyle(
      //                   fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           title: Text(
      //             readings.ecg,
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //               color: kTitleTextColor,
      //             ),
      //           ),
      //         ),
      //       ),

      //     ]))
      // .toList())
    ]);
  }
}
