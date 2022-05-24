// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second/providers/doctor.dart';
import '../widgets/appdrawer.dart';
import '../Providers/auth.dart';
import '../providers/doctor.dart';
import 'chodocscreen.dart';
import 'doctorscreen.dart';
import '../providers/patients.dart';
import 'onboarding_screen.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Doctor>(context, listen: false).FetchDoctorDate().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final doctordata = Provider.of<Doctor>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : doctordata.IsAdoctor(auth.userId)
                ? Text('Hello Doctor')
                : Text(
                    'OnCare',
                  ),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : doctordata.IsAdoctor(auth.userId)
              ? DoctorScreen()
              : OnboardingScreen(),
      // : GridView(
      //     padding: const EdgeInsets.all(10),
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         childAspectRatio: 3 / 2,
      //         crossAxisSpacing: 20,
      //         mainAxisSpacing: 20),
      //     children: [
      //       ClipRRect(
      //           borderRadius: BorderRadius.circular(15),
      //           child: GridTile(
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.of(context)
      //                       .pushNamed(ChosserDoctor.routeName);
      //                 },
      //                 child: Image.network(
      //                   'https://media.istockphoto.com/photos/portrait-of-male-doctor-in-white-coat-and-stethoscope-standing-in-picture-id1327024466?b=1&k=20&m=1327024466&s=170667a&w=0&h=vcw4Exhv4pkR8fMVLNXhNESaKq1HbYwJ1iElLlQBxI0=',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               footer: GridTileBar(
      //                 backgroundColor: Colors.black87,
      //                 title: Text('Choose A doctor'),
      //               ))),
      //       ClipRRect(
      //           borderRadius: BorderRadius.circular(15),
      //           child: GridTile(
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.of(context).pushNamed(
      //                       'ProductDetailScreen.routeName',
      //                       arguments: 'product.id');
      //                 },
      //                 child: Image.network(
      //                   'https://thumbs.dreamstime.com/b/ekg-pulse-bp-respiration-icu-monitor-screen-monitoring-207503127.jpg',
      //                   scale: 1.0,
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               footer: GridTileBar(
      //                 backgroundColor: Colors.black87,
      //                 title: Text('Your Results'),
      //               )))
      //     ],
      //   )
    );
  }
}
