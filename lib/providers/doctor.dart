// ignore_for_file: non_constant_identifier_names, iterable_contains_unrelated_type

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:second/providers/readings.dart';
import 'dart:convert';
import 'patients.dart';

class DoctorData with ChangeNotifier {
  final String id;
  final String Name;
  final String Number;
  final String spcalist;
  final String hospital;

  DoctorData({
    required this.id,
    required this.Name,
    required this.Number,
    required this.spcalist,
    required this.hospital,
  });
}

class Doctor with ChangeNotifier {
  Map<String, DoctorData> _doctorData = {};
  Map<String, DoctorData> get doctoDaata {
    return {..._doctorData};
  }

  int get doctorCount {
    return _doctorData.length;
  }

  bool IsAdoctor(String? DoctorId) {
    final existingID = doctoDaata.containsKey(DoctorId);
    if (!existingID) {
      return false;
    } else {
      return true;
    }
  }

  final String? _authToken;
  Doctor(this._authToken, this._doctorData);
  Future<void> FetchDoctorDate() async {
    final url = Uri.parse(
        'https://spry-autumn-250814-default-rtdb.firebaseio.com/doctors.json?auth=$_authToken');
    final response = await http.get(url);
    print(response.body);
    final Map<String, DoctorData> loadedData = {};

    final extractedDate = json.decode(response.body) as Map<String, dynamic>;

    print(extractedDate['error']);
    if (extractedDate == null || extractedDate['error'] != null) {
      // print('Null check');
      // print(extractedDate['error']);
      // print(authToken);
      // print(extractedDate);
      return;
    }
    extractedDate.forEach((DoctorId, Doctordata) {
      loadedData.putIfAbsent(
          DoctorId,
          () => DoctorData(
                id: DoctorId,
                Name: Doctordata['Name'],
                Number: Doctordata['Phone Number'].toString(),
                spcalist: Doctordata['Specialization'],
                hospital: Doctordata['Hospital'],
              ));
    });
    _doctorData = loadedData;
    print(response.statusCode);
    notifyListeners();
  }
}
