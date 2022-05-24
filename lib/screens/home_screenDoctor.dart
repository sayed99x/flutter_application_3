// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/constant.dart';
import '../providers/patients.dart';
import 'package:provider/provider.dart';
import '../widgets/appdrawer.dart';
import '../widgets/patient_card.dart';

class HomeScreenDoctor extends StatelessWidget {
  static const routeName = '/homescreendoctor';
  @override
  Widget build(BuildContext context) {
    final PatientsData = Provider.of<Patient>(context, listen: false);
    final extractedData = PatientsData.AllPatientsData;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('OnCare'),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       SvgPicture.asset('assets/icons/menu.svg'),
              //       SvgPicture.asset('assets/icons/profile.svg'),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Contact with Patients or Remove anyOne by swaping',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => PatientCard(
                    extractedData[i].id,
                    extractedData[i].Name,
                    extractedData[i].age,
                    extractedData[i].number,
                    extractedData[i].readings),
                itemCount: PatientsData.AllPatientsData.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
