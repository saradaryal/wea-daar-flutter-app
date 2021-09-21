import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:weadaar_app/AllScreens/mainscreen.dart';
//import 'package:weadaar_app/AllScreens/mainscreen.dart';
import 'package:weadaar_app/AllScreens/signinSignup.dart';
//import 'package:weadaar_app/main.dart';

class SignupPage extends StatefulWidget {
  static const String idScreen = "SignupPage";
 
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController repasswordTextEditingController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'Signup',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                

                Container(
                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5.0),
                        TextField(
                          controller: nameTextEditingController,
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        TextField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        
                        SizedBox(height: 5.0),
                        TextField(
                          controller: passwordTextEditingController,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        TextField(
                          controller: repasswordTextEditingController,
                          decoration: InputDecoration(
                              labelText: 'REENTER PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                                  obscureText: true,
                        ),
                        SizedBox(height: 30.0),
                        Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blueAccent,
                              color: Colors.blue,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  // if (nameTextEditingController.text.length < 4){
                                  //   displayToastMessage("Nmae must be at least 3 characters", context);
                                  // }else if(!emailTextEditingController.text.contains("@")){
                                  //   displayToastMessage("Email is invalid", context);
                                  // }else if (passwordTextEditingController.text.length < 8){
                                  //   displayToastMessage("The password must be atleast 7 characters", context);
                                  // }else if (repasswordTextEditingController.text.compareTo(passwordTextEditingController.text) != 0){
                                  //   displayToastMessage("The password must match", context);
                                  // }else{
                                  // registerNewUser(context);
                                  // }
                                   Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
                                },
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context, SigninSignup.idScreen, (route) => false);
                              },
                              child: Center(
                                child: Text(' Already have an account? Go Back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
   ),
    SizedBox(height: 20.0),
             Center(
                        child: Text("OR", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                      ), 
  
   Container(
                child: Padding (
                padding: EdgeInsets.only(left: 25.0, top: 20.0, right: 25.0, bottom: 20.0),
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

              ),
              
                
              ]),
        ));
  }
  //  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; 
  //    void registerNewUser(BuildContext context) async 
  //                   {
  //                       final User firebaseUser = (await
  //                        _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text,
  //                         password: passwordTextEditingController.text
  //                         ).catchError((errMsg){
  //                           displayToastMessage("Error: " + errMsg.toString(), context);
  //                                                     })).user;
                                                      
  //                                               if(firebaseUser != null){
  //                                                 Map userDataMap ={
  //                                                   "email": emailTextEditingController.text.trim(),
  //                                                   "password": passwordTextEditingController.text.trim(), 
  //                                                   "repassword": repasswordTextEditingController.text.trim(),
  //                                                 };
  //                                                 usersRef.child(firebaseUser.uid).set(userDataMap);
  //                                                 displayToastMessage("Congratulatinos your account has been created", context);
  //                                                 Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
  //                                               }
  //                                               else{
  //                                                 displayToastMessage("The new user account has not been created", context);

                            
  //                                               }
  //                                               }
               
}




// displayToastMessage(String message, context){
//  Fluttertoast.showToast(msg: message);
// }