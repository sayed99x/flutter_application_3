// ignore_for_file: prefer_const_constructors

import '../widgets/chatmain.dart';

import '../widgets/schedule_card.dart';
import '../models/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PatientDetailScreen extends StatelessWidget {
  String _name;
  String age;
  Map<String, dynamic> readings;

  PatientDetailScreen(this._name, this.age, this.readings);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background2.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/3dots.svg',
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/doctor1.jpg',
                            height: 120,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$age Year',
                                style: TextStyle(
                                  color: kTitleTextColor.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  // Container(
                                  //   padding: EdgeInsets.all(10),
                                  //   decoration: BoxDecoration(
                                  //     color: kBlueColor.withOpacity(0.1),
                                  //     borderRadius: BorderRadius.circular(10),
                                  //   ),
                                  //   child: InkWell(
                                  //     onTap: () {},
                                  //     child: SvgPicture.asset(
                                  //       'assets/icons/phone.svg',
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: 16,
                                  // ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kYellowColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(ChatMain.routeName);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/chat.svg',
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 16,
                                  // ),
                                  // Container(
                                  //   padding: EdgeInsets.all(10),
                                  //   decoration: BoxDecoration(
                                  //     color: kOrangeColor.withOpacity(0.1),
                                  //     borderRadius: BorderRadius.circular(10),
                                  //   ),
                                  //   child: SvgPicture.asset(
                                  //     'assets/icons/video.svg',
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '$_name results',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            readings['HP'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kTitleTextColor,
                            ),
                          ),
                        ),
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
                            readings['SpO2'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kTitleTextColor,
                            ),
                          ),
                        ),
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
                            readings['preesure'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kTitleTextColor,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.blue[100],
                        elevation: 5,
                        child: ListTile(
                          leading: FittedBox(
                            child: Text(
                              'temp:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            readings['temp'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kTitleTextColor,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.blue[100],
                        elevation: 5,
                        child: ListTile(
                          leading: FittedBox(
                            child: Text(
                              'Ecg:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            readings['ecg'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kTitleTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
