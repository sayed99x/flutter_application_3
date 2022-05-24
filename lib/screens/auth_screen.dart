// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/auth.dart';
import '../models/http_excepation.dart';

enum AuthMode { Signup, Login, PatientSignUp }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                      // argument transform dh 34an 5atrr nta lw 3ywz to7ot el container
                      // b 4kl mo3een
                      // .. 34an el function translate (btlf elcontainer y3nii bt5leha yb2a b zawya) b return void w na 3awzh t return el
                      // matrix f 3mlt .. tnfz el function bs don't return it
                      // transform: Matrix4.rotationZ(-8 * pi / 180)
                      //   ..translate(-10.0),
                      // ..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'OnCare',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    // de bt5ly el child bt3ha y5od ad A mn el size kolo y3ni y5od atnen mn el
                    // size lw kan akbr aw 1 bs
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  // hena 7tet el map de 34an a save 3leha b3d m a5od mn el user
  // el email w el password
  Map<dynamic, dynamic> _authData = {
    'email': '',
    'password': '',
    'Name': '',
    'Spcialist': '',
    'age': '',
    'hospital': '', // new
    'phoneNumber': '',
    'chossenDoctor': '',
  };
  // de el functuion elly httnfz awl ma y7sl error
  void _showDialog(String massage) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error occured'),
              content: Text(massage),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  var _isLoading = false;
  //
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false)
            .Login(_authData['email'], _authData['password']);
        // Log user in
      } else if (_authMode == AuthMode.Signup) {
        await Provider.of<Auth>(context, listen: false)
            .Signup(_authData['email'], _authData['password']);
        await Provider.of<Auth>(context, listen: false).saveDoctorDate(
            _authData['Name'],
            selectedValue!,
            _authData['phoneNumber'],
            _authData['hospital']);
        // await Provider.of<Auth>(context, listen: false).FetchDoctorDate();
        // Sign user up
      } else if (_authMode == AuthMode.PatientSignUp) {
        await Provider.of<Auth>(context, listen: false)
            .Signup(_authData['email'], _authData['password']);
        await Provider.of<Auth>(context, listen: false).savePatientDate(
            _authData['Name'], _authData['age'], _authData['phoneNumber']);
      }
    } on HttpExcepation catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showDialog(errorMessage);
    } catch (error) {
      var errorMassage = 'Could not authenticate, try again later';
      _showDialog(errorMassage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else if (_authMode == AuthMode.Signup) {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
    // else if (_authMode == AuthMode.Login && _authMode == AuthMode.Signup) {
    //   setState(() {
    //     _authMode == AuthMode.PatientSignUp;
    //   });
    // }

    print(_authMode);
  }

  // void _switch2() {
  //   if (_authMode == AuthMode.Login) {
  //     setState(() {
  //       _authMode == AuthMode.PatientSignUp;
  //     });
  //   } else if (_authMode == AuthMode.PatientSignUp) {
  //     setState(() {
  //       _authMode == AuthMode.Login;
  //     });
  //   }
  //   print(_authMode);

  // }

  List<DropdownMenuItem<String>> get spcialistItems {
    List<DropdownMenuItem<String>> Items = [
      DropdownMenuItem(
        child: Text('Choose Spcilist'),
        value: 'Choose Spcilist',
      ),
      DropdownMenuItem(
        child: Text('Heart And Blood'),
        value: 'Heart And Blood',
      ),
      DropdownMenuItem(
        child: Text('Skin'),
        value: 'Skin',
      )
    ];
    return Items;
  }

  String? selectedValue = 'Choose Spcilist';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: 400,
        // height: _authMode == AuthMode.Login ? 300 : 700 ,
        constraints: BoxConstraints(
            minHeight: 400), //_authMode == AuthMode.Login ? 300 : 700),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                if (_authMode == AuthMode.Signup ||
                    _authMode == AuthMode.PatientSignUp)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Name is too short!';
                      }
                    },
                    onSaved: (value) {
                      _authData['Name'] = value!;
                    },
                  ),
                if (_authMode == AuthMode.PatientSignUp)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty || int.parse(value) < 0) {
                        return 'Please Enter A valid Age';
                      }
                    },
                    onSaved: (value) {
                      _authData['age'] = value!;
                    },
                  ),
                if (_authMode == AuthMode.PatientSignUp)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty || value.length != 11) {
                        return 'Please Enter A valid Number';
                      }
                    },
                    onSaved: (value) {
                      _authData['phoneNumber'] = value!;
                    },
                  ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty || value.length != 11) {
                        return 'Please Enter A valid Number';
                      }
                    },
                    onSaved: (value) {
                      _authData['phoneNumber'] = value!;
                    },
                  ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Hospital'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Please Enter A valid Hospital Name';
                      }
                    },
                    onSaved: (value) {
                      _authData['hospital'] = value!;
                    },
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                if (_authMode == AuthMode.PatientSignUp)
                  TextFormField(
                    enabled: _authMode == AuthMode.PatientSignUp,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.PatientSignUp
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 10,
                ),
                if (_authMode == AuthMode.Signup)
                  DropdownButton(
                    // onTap: () {
                    //   Provider.of<Auth>(context, listen: false).FetchDoctorDate();
                    // },
                    elevation: 10,
                    items: spcialistItems,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                  ),
                SizedBox(
                  height: 10,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                if (_authMode != AuthMode.PatientSignUp)
                  FlatButton(
                    child: Text(
                        '${_authMode == AuthMode.Login ? 'DoctorSignUp' : 'LOGININSTEAD'} '),
                    onPressed: _switchAuthMode,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textColor: Theme.of(context).primaryColor,
                  ),
                if (_authMode != AuthMode.Signup)
                  FlatButton(
                    child: Text(
                        '${_authMode == AuthMode.Login ? 'PatienSignUp' : 'LOGININSTEAD'}'),
                    onPressed: () {
                      setState(() {
                        if (_authMode == AuthMode.Login) {
                          _authMode = AuthMode.PatientSignUp;
                        } else if (_authMode == AuthMode.PatientSignUp) {
                          _authMode = AuthMode.Login;
                        }
                      });
                      print(_authMode);
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textColor: Theme.of(context).primaryColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
