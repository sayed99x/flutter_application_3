
import 'package:flutter/material.dart';
import 'readings.dart';
import 'readings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Patients {
  final String Name;
  final String age;
  final String number;
  final Map<String, dynamic> readings;

  Patients(
      {required this.Name,
      required this.age,
      required this.number,
      required this.readings});
}

class AllPatients {
  final String id;
  final String Name;
  final String age;
  final String number;
  final Map<String, dynamic> readings;

  AllPatients({
    required this.id,
    required this.Name,
    required this.age,
    required this.number,
    required this.readings,
  });
}


class Patient with ChangeNotifier {
  List<Patients> _PatientsData = [];
  List<Patients> get PatientsData {
    return [..._PatientsData];
  }

  // List<Readings> _userReadings = [];
  // List<Readings> get userReadings {
  //   return [..._userReadings];
  // }

  List<AllPatients> _AllPatientsData = [];
  List<AllPatients> get AllPatientsData {
    return [..._AllPatientsData];
  }

  //print();
  int get doctorCount {
    return PatientsData.length;
  }

  // bool IsPatient(String? PatientId) {
  //   final existingID = doctoDaata.containsKey(PatientId);
  //   if (!existingID) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  final String? _authToken;
  final String? _userId;
  Patient(this._authToken, this._userId, this._PatientsData);
  Future<void> FetchPatientDate() async {
    // user Data
    final url = Uri.parse(
        'https://spry-autumn-250814-default-rtdb.firebaseio.com/patients/$_userId.json?auth=$_authToken');
    final response = await http.get(url);
    final List<Patients> loadedData = [];
    print(_userId);
    // readings data
    // url = Uri.parse(
    //     'https://spry-autumn-250814-default-rtdb.firebaseio.com/patients/$_userId/readings.json?auth=$_authToken');
    // final List<Readings> UserDataReadings = [];
//    // all Patient
    
    final extractedDate = json.decode(response.body) as Map<String, dynamic>;
    // final readingsData =
    //     json.decode(responseReadings.body) as Map<String, dynamic>;
    print(extractedDate);
    //  print(readingsData);
    print(extractedDate['error']);
    if (extractedDate == null || extractedDate['error'] != null) {
      // print('Null check');
      // print(extractedDate['error']);
      // print(authToken);
      // print(extractedDate);
      return;
    }
    loadedData.add(Patients(
      Name: extractedDate['Name'],
      number: extractedDate['phoneNumeber'].toString(),
      age: extractedDate['age'].toString(),
      readings: extractedDate['readings'] as Map<String, dynamic>
          // .map((e) => Readings(
          //     Hp: e['HP'].toString(),
          //     SpO2: e['SpO2'].toString(),
          //     ecg: e['ecg'].toString(),
          //     preasure: e['preesure'].toString(),
          //     temp: e['temp'].toString()))
          // .toList(),
    ));
    _PatientsData = loadedData;
    print(response.statusCode);
    notifyListeners();
    // UserDataReadings.add(Readings(
    //     Hp: readingsData['HP'].toString(),
    //     SpO2: readingsData['SpO2'].toString(),
    //     ecg: readingsData['ecg'].toString(),
    //     preasure: readingsData['preesure'].toString(),
    //     temp: readingsData['temp'].toString()));
    // _userReadings = UserDataReadings;
    // final readings = loadedData.
    // final readings = loadedData.forEach((element) => Readings(
    //     Hp: element.readings['HP'].toString(),
    //     SpO2: element.readings['SpO2'].toString(),
    //     ecg: element.readings['ecg'].toString(),
    //     preasure: element.readings['preesure'].toString(),
    //     temp: element.readings['temp'].toString()));

    // print([readings]);
  }
Future<void> fetchAllPatientData() async {
final url = Uri.parse(
        'https://spry-autumn-250814-default-rtdb.firebaseio.com/patients/.json?auth=$_authToken');
    final List<AllPatients> loadedAllPatient = [];
    final PatientsResponse = await http.get(url);
    final AllPatientsData =
        json.decode(PatientsResponse.body) as Map<String, dynamic>;
    print(AllPatientsData);
    AllPatientsData.forEach((PatientId, PatientData) {
      loadedAllPatient.add(AllPatients(
          id: PatientId,
          Name: PatientData['Name'],
          age: PatientData['age'].toString(),
          number: PatientData['phoneNumber'].toString(),
          readings: PatientData['readings'] as Map<String, dynamic>
          // forEach((DataId, Datavalue) { 
          //  UserDataReadings.add(Readings(Hp: Datavalue.toString(), SpO2: Datavalue.toString(), ecg: Datavalue/, preasure: value['preesure'], temp: value['temp']));
          // })
          // readings: (PatientData['readings'] as List<dynamic>)
          //     .map((e) => Readings(
          //         Hp: e['HP'].toString(),
          //         SpO2: e['SpO2'].toString(),
          //         ecg: e['ecg'].toString(),
          //         preasure: e['preesure'].toString(),
          //         temp: e['temp'].toString()))
          //     .toList()
              ));
    });
    _AllPatientsData = loadedAllPatient;
}
}
