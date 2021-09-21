
//import 'package:firebase/firebase.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weadaar_app/AllScreens/currWeather.dart';
import 'package:weadaar_app/AllScreens/insurance.dart';
import 'package:weadaar_app/AllScreens/loginScreen.dart';
import 'package:weadaar_app/AllScreens/mainscreen.dart';
import 'package:weadaar_app/AllScreens/signinSignup.dart';
import 'package:weadaar_app/AllScreens/signup.dart';
import 'package:weadaar_app/AllScreens/timeline.dart';
import 'package:weadaar_app/AllScreens/weather.dart';

import 'DataHandler/appData.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {//async{
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
  }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
//DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");

class _MyAppState extends State<MyApp> {
@override
Widget build(BuildContext context){
  return ChangeNotifierProvider(
    create: (context) => AppData(),
      child: MaterialApp(
      title: 'Wea-Daar App',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.idScreen,
      routes:{
        LoginScreen.idScreen: (context) => LoginScreen(),
        SignupPage.idScreen: (context) => SignupPage(),
        SigninSignup.idScreen: (context) => SigninSignup(),
        MainScreen.idScreen: (context) => MainScreen(),
        WeatherScreen.idScreen: (context) => WeatherScreen(),
        CurrentWeather.idScreen: (context) => CurrentWeather(),
        InsuranceScreen.idScreen: (context) => InsuranceScreen(),
        TimeLinePage.idScreen: (context) => TimeLinePage() 
      },
      debugShowCheckedModeBanner: false,
      
      ),
  );
}
  
}
