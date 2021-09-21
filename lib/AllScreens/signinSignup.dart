import 'package:flutter/material.dart';
import 'package:weadaar_app/AllScreens/mainscreen.dart';
//import 'package:weadaar_app/AllScreens/signup.dart';

class SigninSignup extends StatefulWidget {
  static const String idScreen = "SigninSignupPage";
  @override
  _SigninSignupState createState() => new _SigninSignupState();
}

class _SigninSignupState extends State<SigninSignup> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Get',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Started',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(275.0, 180.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
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
                            Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
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
                    Container(
                child: Padding (
                padding: EdgeInsets.only(left: 25.0, top: 40.0, right: 25.0, bottom: 20.0),
                child: Column (children: [
                 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/facebook.png', width: 40.0, height: 40.0,),
                        Image.asset('images/instagram.png', width: 40.0, height: 40.0,),
                        Image.asset('images/google.png', width: 40.0, height: 40.0,),
                        ],
                        ),
                      
                    
                  ],),
               
              ),

              )
           
                  ],
                )),
            
          ],
        ));
  }
}
