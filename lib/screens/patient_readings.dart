import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';
import '../providers/auth.dart';
import '../widgets/userresults.dart';
import '../models/constant.dart';

class PatientReadings extends StatelessWidget {
  static const routerName = '/PatientReadings';
  @override
  Widget build(BuildContext context) {
    final patientdata = Provider.of<Patient>(context, listen: false);
    // final patient = patientdata.PatientsData;
    //  final readings = patientdata.userReadings;
    return Scaffold(
      appBar: AppBar(
        title: Text('OnCare'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) => UserData(patientdata.PatientsData[i]),
              itemCount: patientdata.PatientsData.length,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   child: Text(
            //     'Your Results',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //       color: kTitleTextColor,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (ctx, i) => UserReadings(
            //       readings[i].Hp,
            //       readings[i].SpO2,
            //       readings[i].ecg,
            //       readings[i].preasure,
            //       readings[i].temp),
            //   itemCount: readings.length,
            // )
          ],
        ),
      ),
    );
  }
}
