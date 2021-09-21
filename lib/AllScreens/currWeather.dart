import 'package:flutter/material.dart';
//import 'package:weadaar_app/AllWidgets/Divider.dart';

// import 'package:provider/provider.dart';
// import 'package:weadaar_app/AllWidgets/Divider.dart';
// import 'package:weadaar_app/AllWidgets/configMaps.dart';
// import 'package:weadaar_app/Assistants/requestAssistant.dart';
// import 'package:weadaar_app/DataHandler/appData.dart';
//import 'package:provider/provider.dart';
//import 'package:weadaar_app/DataHandler/appData.dart';

class CurrentWeather extends StatefulWidget {
   static const String idScreen = "CurrentWeather";
  @override
  _CurrentWeatherState createState() => new _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
   
  @override    
  Widget build(BuildContext context) {
  // String placeAddress = Provider.of<AppData>(context).pickUpLocation.placeName ?? "";
    //pickUpTextEditingController.text = placeAddress;
    return Scaffold(
        body: Column(

         children: [
           Container(
             height: 300.0,
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [
                 BoxShadow(color: Colors.black,
                 blurRadius: 6.0,
                 spreadRadius: 0.5,
                 offset: Offset(0.7,0.7),
                 ),
               ],
             ),
              child: Padding (
                padding: EdgeInsets.only(left: 25.0, top: 40.0, right: 25.0, bottom: 20.0),
                child: Column (children: [
                  SizedBox(height: 5.0),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(
                          Icons.arrow_back
                        ),
                      ),
                      Center(
                        child: Text("Current Weather", style: TextStyle(fontSize: 24.0,))
                      ),
                     
                    ],),
                     SizedBox(height: 20.0),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        ],
                        ),
                        SizedBox(height: 10),
                          Center(
                          child: Text("Tody's Weather", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
                        ),
                         Center(
                          child: Text("High: 78 Degree", style: TextStyle(fontSize: 15.0, ))
                          // child: Text("High: 78 Degree", style: TextStyle(fontSize: 20.0))
                        ),
                        Center(
                          child: Text("Low: 58 Degree", style: TextStyle(fontSize: 15.0))
                          // child: Text("High: 78 Degree", style: TextStyle(fontSize: 20.0))
                        ),
                        Center(
                          child: Text("No chance of bad weather Today! Drive Safe!", style: TextStyle(fontSize: 14.0))
                          // child: Text("High: 78 Degree", style: TextStyle(fontSize: 20.0))
                        ),
                  ],),
               
              ),
              ),
              Container(
                child: Padding (
                padding: EdgeInsets.only(left: 25.0, top: 40.0, right: 25.0, bottom: 20.0),
                child: Column (children: [
                  SizedBox(height: 5.0),
                  Stack(
                    children: [
  
                      Center(
                        child: Text("Next 9 Days Weather", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))
                      ),
                     
                    ],),
                     SizedBox(height: 20.0),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        ],
                        ),
                      
                        Center(
                          child: Text("Good                    Good                        Good",style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold) ),
                        ),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        ],
                        ),
                          Center(
                          child: Text("Wind                    Snow                        Good",style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold) ),
                        ),

                        SizedBox(height: 10),
                         Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        Image.asset('images/weather.png', width: 100.0, height: 90.0,),
                        ],
                        ),
                          Center(
                          child: Text("Good               Partly Cloudy               Rain",style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold) ),
                        ),

          
                  ],),
               
              ),

              )
           







        
         ],
         
         )
         
         
         
         );
  }
        }