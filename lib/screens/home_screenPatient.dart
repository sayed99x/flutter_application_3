// ignore_for_file: use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, file_names

import '../widgets/appdrawer.dart';

import '../widgets/category_card.dart';
import '../widgets/doctor_card.dart';
import '../widgets/readings_bar.dart';
import '../models/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/doctor.dart';

class HomeScreenPatient extends StatelessWidget {
  static const routeName = '/homeScreenApp';
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    final doctorData = doctor.doctoDaata;
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
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find Your Desired\nDoctor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ReadingsBar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Categories',
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
              buildCategoryList(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Contact with Doctors',
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
                itemBuilder: (ctx, i) => DoctorCard(
                    doctorData.values.toList()[i].Name,
                    doctorData.values.toList()[i].hospital,
                    doctorData.values.toList()[i].Number,
                    'assets/images/doctor1.jpg'),
                itemCount: doctorData.length,
              )
             //  buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Dental\nSurgeon',
            'assets/icons/dental_surgeon.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Heart\nSurgeon',
            'assets/icons/heart_surgeon.png',
            kYellowColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Eye\nSpecialist',
            'assets/icons/eye_specialist.png',
            kOrangeColor,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  // buildDoctorList() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 30,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         ListView.builder(
  //           itemBuilder: (ctx, i) => DoctorCard(
  //             'Dr. Stella Kane',
  //             'Heart Surgeon - Flower Hospitals',
  //             'assets/images/doctor1.jpg',
  //             kBlueColor,
  //           ),
  //           itemCount: DoctorData,
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         // DoctorCard(
  //         //   'Dr. Joseph Cart',
  //         //   'Dental Surgeon - Flower Hospitals',
  //         //   'assets/images/doctor2.png',
  //         //   kYellowColor,
  //         // ),
  //         // SizedBox(
  //         //   height: 20,
  //         // ),
  //         // DoctorCard(
  //         //   'Dr. Stephanie',
  //         //   'Eye Specialist - Flower Hospitals',
  //         //   'assets/images/doctor3.jpg',
  //         //   kOrangeColor,
  //         // ),
  //         // SizedBox(
  //         //   height: 20,
  //         // ),
  //       ],
  //     ),
  //   );
 // }
}

