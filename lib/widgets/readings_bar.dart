// ignore_for_file: prefer_const_constructors

import '../screens/patient_readings.dart';

import '../models/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';

class ReadingsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Provider.of<Patient>(context, listen: false).FetchPatientDate();
        Navigator.of(context).pushNamed(PatientReadings.routerName);
      },
      splashColor: Colors.deepOrange,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: RaisedButton(
              child: Text('Your Results'),
              onPressed: () async {
                await Provider.of<Patient>(context, listen: false)
                    .FetchPatientDate();

                Navigator.of(context).pushNamed(PatientReadings.routerName);
              },
              color: Colors.white,
            )),
      ),
    );
    // Align(
    //   alignment: Alignment.centerRight,
    //   child: MaterialButton(
    //     onPressed: () {},
    //     color: kOrangeColor,
    //     padding: EdgeInsets.symmetric(
    //       horizontal: 10,
    //       vertical: 15,
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30),
    //     ),
    //     child: SvgPicture.asset('assets/icons/search.svg'),
    //   ),
    // ),
  }
}
