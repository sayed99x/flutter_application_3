import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/onboarding_screen.dart';
import './screens/auth_screen.dart';
import './Providers/auth.dart';
import './screens/splash_screen.dart';
import './screens/home_screen.dart';
import './providers/doctor.dart';
import './screens/chodocscreen.dart';
import './providers/patients.dart';
import 'screens/home_screenPatient.dart';
import './screens/detail_screen.dart';
import './screens/patient_readings.dart';
import './screens/home_screenDoctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './widgets/chatmain.dart';

void main() /*async*/ {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // changeNotifierProvider
    // 1- dh 7aga b provide elwidgit de bl childs bto3ha b data mo3eena 3la
    // 7sb el create elly nta bt7to
    // hena 3mlt 7aga asmha Multiprovider w hena by50d aktr mn provider wa7d

    return MultiProvider(
        // hena aho 7tet el provider bto3y 3ady
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          // el proxy provider dh 34an lw na 3awz an2l data mn provider l provider tany
          // f bst5dm el provider proxy
          ChangeNotifierProxyProvider<Auth, Doctor>(
            create: (_) => Doctor(null, {}),
            update: (_, auth, perviousData) => Doctor(auth.token,
                perviousData == null ? {} : perviousData.doctoDaata),
          ),
          ChangeNotifierProxyProvider<Auth, Patient>(
            create: (_) => Patient(null, null, []),
            update: (_, auth, perviousData) => Patient(auth.token, auth.userId,
                perviousData == null ? [] : perviousData.PatientsData),
          ),
          // ChangeNotifierProxyProvider<Auth, Products>(
          //     create: (_) => Products(null, null, []),
          //     update: (_, auth, perviousProduct) => Products(
          //         auth.token,
          //         auth.userId,
          //         perviousProduct == null ? [] : perviousProduct.items)),
          // ChangeNotifierProvider(create: (ctx) => cart()),
          // ChangeNotifierProxyProvider<Auth, orders>(
          //   create: (_) => orders(null, null, []),
          //   update: (_, auth, pervorders) => orders(auth.token, auth.userId,
          //       pervorders == null ? [] : pervorders.Orders),
          // ),
        ],

        // 2- hena 7tt elcreate n na 2olto nta htprovide el widgits and childs b class Products
        // elly feh el items kolha aw el products kolha
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: auth.isAuth
                ? homeScreen()
                : FutureBuilder(
                    future: auth.tryLogin(),
                    builder: (ctx, snapShots) =>
                        snapShots.connectionState == ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen()),
            routes: {
              // ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              // CartScreen.routename: (ctx) => CartScreen(),
              // OrderScreen.routename: (ctx) => OrderScreen(),
              // UserProduct.routename: (ctx) => UserProduct(),
              // EditProduct.routename: (ctx) => EditProduct(),
              ChosserDoctor.routeName: (ctx) => ChosserDoctor(),
              OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
              HomeScreenPatient.routeName: (ctx) => HomeScreenPatient(),
              PatientReadings.routerName: (ctx) => PatientReadings(),
              HomeScreenDoctor.routeName: (ctx) => HomeScreenDoctor(),
              ChatMain.routeName: (ctx) => ChatMain(),
            },
          ),
        ));
  }
}
