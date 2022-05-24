import 'package:flutter/material.dart';
import 'package:second/providers/readings.dart';
import '../providers/patients.dart';
import '../models/constant.dart';
import '../models/constant.dart';
import '../screens/patient_detialscreen.dart';

class PatientCard extends StatelessWidget {
  final String id;
  final String name;
  final String age;
  final String phoneNumber;
  final Map<String, dynamic> readings;
  PatientCard(this.id, this.name, this.age, this.phoneNumber, this.readings);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientDetailScreen(name, age, readings),
            ),
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset('assets/images/doctor1.jpg'),
              title: Text(
                '${name}',
                style: TextStyle(
                  color: kTitleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                age,
                style: TextStyle(
                  color: kTitleTextColor.withOpacity(0.7),
                ),
              ),
              trailing: Text(phoneNumber),
            ),
          ),
        ),
      ),
    ]);
  }
}
