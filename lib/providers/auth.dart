// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_excepation.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import './readings.dart';

class Auth with ChangeNotifier {
  // this token expires after one hour so user have to login again
  String? _token;
  DateTime? _ExpieyDate;
  String? _userId;
  Timer? _authTimer;

  Future<void> _authenticated(
      String email, String password, String UrlSagament) async {
    // hena el link aw el url mo5tlf bgybo mn 3la eldata base 3ndy lma agy a3mlo authentication
    // l login w el sign up
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$UrlSagament?key=AIzaSyDxrYU6VgX2_aTRFpTkEXVo85BrBY57XTY');
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final responseDate = json.decode(response.body);
      if (responseDate['error'] != null) {
        throw HttpExcepation(responseDate['error']['message']);
      }
      _token = responseDate['idToken'];
      print(token);
      _ExpieyDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseDate['expiresIn'])));
      print(_ExpieyDate);
      _userId = responseDate['localId'];
      _autoLogout();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expierydate': _ExpieyDate!.toIso8601String()
      });
      prefs.setString('userData', userData);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_token != null &&
        _ExpieyDate != null &&
        _ExpieyDate!.isAfter(DateTime.now())) {
      return _token;
    }
  }

  String? get userId {
    return _userId;
  }
  // hena el function bta3t el logout w n hena 3mltha w 7eet nha tkoon f eldrawer

  void Logout() async {
    // w hena na b5ly kol 7aga b null
    _token = null;
    _ExpieyDate = null;
    _userId = null;
    // hena b5ly el authtimer yb2a b null 34an na 5las 3mlt logout
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    // w hena brdo b ms7 ay 7aga aw ay token mowgow f eldevice storage
    // 34an na f elmain dart ms5tm futureBuilder elly ht5ly el function bt3t autologin
    // t4t8l l2no already m3ah el token f na hena wzfety n a3ml clear elly mowgwda f eldata de
    final perfs = await SharedPreferences.getInstance();
    // perf.remove('key');
    perfs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToexpiary = _ExpieyDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(
        Duration(
          seconds: timeToexpiary,
        ),
        Logout);
    notifyListeners();
  }

// hena b5ly el user yfdl y login tool m m elxpiry date lsa mntha4
  Future<bool?> tryLogin() async {
    // shared_perfernce de bt5leny awsl gwa el device storage
    final perfs = await SharedPreferences.getInstance();
    // hena b check lw f el key dh wla l2
    if (!perfs.containsKey('userData')) {
      return false;
    }
    // lw mogowd el key tla3ly el data bma fehom el expiery date
    final extractedDate =
        json.decode(perfs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedDate['expierydate']);
    // w b check b 4oof lw el expiary data 2bl dlw2ty yb2a hwa aked expire token
    if (expiryDate.isBefore(DateTime.now())) {
      // the token is invalid
      return false;
    }
    // lw 8eer keda b overwirte eltoken w eluser id
    _token = extractedDate['token'];
    _userId = extractedDate['userId'];
    _ExpieyDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> Signup(String email, String password) async {
    // na 3mlt hena return 34an a5ly de future b7es nha tro7 3la el _autenticated
    // 34an hy kman future f kan lazm a3mlha return 34an tro7 tnfzh gwe el future elly
    // t7t de
    return _authenticated(email, password, 'signUp');
  }

  Future<void> PatientSignup(String email, String password) async {
    // na 3mlt hena return 34an a5ly de future b7es nha tro7 3la el _autenticated
    // 34an hy kman future f kan lazm a3mlha return 34an tro7 tnfzh gwe el future elly
    // t7t de
    return _authenticated(email, password, 'signUp');
  }

  Future<void> Login(String email, String password) async {
    return _authenticated(email, password, 'signInWithPassword');
  }

  Future<void> saveDoctorDate(String name, String? spcilist, String phoneNumber,
      String hospital) async {
    final url = Uri.parse(
        'https://spry-autumn-250814-default-rtdb.firebaseio.com/doctors/$_userId.json?auth=$token');
    final response = await http.put(url,
        body: json.encode({
          'Name': name,
          'Specialization': spcilist,
          'Phone Number': int.parse(phoneNumber),
          'Hospital': hospital,
        }));
    notifyListeners();
  }

  Future<void> savePatientDate(
    String name,
    String age,
    String phoneNumber,
  ) async {
    // List<double> Readings = [];
    final url = Uri.parse(
        'https://spry-autumn-250814-default-rtdb.firebaseio.com/patients/$userId.json?auth=$token');
    final response = await http.put(url,
        body: json.encode({
          'Name': name,
          'age': int.parse(age),
          'phoneNumber': int.parse(phoneNumber),
          'readings': 
            {
            'HP': 35,
            'SpO2': 40,
            'preesure': 80,
            'ecg': 30,
            'temp': 37,
          }
          
        }));
    print(response.body);
    print(response.statusCode);
    notifyListeners();
  }
}
