import 'package:flutter/material.dart';
import 'package:weadaar_app/AllScreens/mainscreen.dart';
import 'package:weadaar_app/AllScreens/signinSignup.dart';
import 'package:weadaar_app/AllScreens/signup.dart';

class LoginScreen extends StatelessWidget{
  static const String idScreen = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
         children:[
            SizedBox(height: 65.0,),
            Image(
              image: AssetImage("images/logo.png"),
              width: 425.0,
              height: 425.0,
              alignment: Alignment.center,
              ),

            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    
                    
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, SigninSignup.idScreen, (route) => false);
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                 SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                             Navigator.pushNamedAndRemoveUntil(context, SignupPage.idScreen, (route) => false);
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
 
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Text(
                    'Use Wea-Daar as Guest?',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )

         ],
      )
    );
  }
  
}