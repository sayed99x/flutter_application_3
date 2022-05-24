import 'package:flutter/material.dart';
import 'package:second/providers/patients.dart';
import 'home_screenDoctor.dart';
import '../models/constant.dart';
import 'home_screenPatient.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Patient>(context, listen: false)
          .fetchAllPatientData()
          .then((_) {
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
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/background.jpg',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello Doctor\n Know Your Patients Results\n and Contact with them',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: kTitleTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'تعرف علي نتائج مرضاك وتواصل معاهم ',
                            style: TextStyle(
                              fontSize: 20,
                              color: kTitleTextColor.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(HomeScreenDoctor.routeName);
                            },
                            color: kOrangeColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
