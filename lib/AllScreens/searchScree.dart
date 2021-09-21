import 'package:flutter/material.dart';
import 'package:weadaar_app/AllScreens/weather.dart';
//import 'package:weadaar_app/AllWidgets/configMaps.dart';
//import 'package:weadaar_app/Assistants/requestAssistant.dart';
//import 'package:provider/provider.dart';
//import 'package:weadaar_app/DataHandler/appData.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
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
             height: 250.0,
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
                        child: Text("View Route and Weather Info", style: TextStyle(fontSize: 18.0,))
                      )

                    ],
                    ),
                  SizedBox(height: 16.0),
                    Row(
                      children: [
                      Image.asset("images/pickicon.png", height: 16.0, width: 16.0,),

                      SizedBox(width: 18.0,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                            //  controller: pickUpTextEditingController,
                              decoration: InputDecoration(
                                hintText: "From?",
                                fillColor: Colors.grey[400],
                                filled: true, 
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                              ),
                            ),
                          ),
                        ),
                        ),


                    ],),

                  SizedBox(height: 10.0),
                    Row(children: [
                      Image.asset("images/desticon1.png", height: 16.0, width: 16.0,),

                      SizedBox(width: 18.0,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                            //  controller: dropOffTextEditingController,
                              decoration: InputDecoration(
                                hintText: "Where To?",
                                fillColor: Colors.grey[400],
                                filled: true, 
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                              )
                            )
                          )
                        ),
                        ),
                    ],),
                    



                  // SizedBox(height: 10.0),
                  //   Row(children: [
                  //     Image.asset("images/car_android.png", height: 24.0, width: 24.0,),

                  //     SizedBox(width: 18.0,),
                  //     Expanded(
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey[400],
                  //           borderRadius: BorderRadius.circular(5.0),
                  //         ),
                  //         child: Padding(
                  //           padding: EdgeInsets.all(3.0),
                  //           child: TextField(
                  //           //  controller: dropOffTextEditingController,
                  //             decoration: InputDecoration(
                  //               hintText: "Where To?",
                  //               fillColor: Colors.grey[400],
                  //               filled: true, 
                  //               border: InputBorder.none,
                  //               isDense: true,
                  //               contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                  //             )
                  //           )
                  //         )
                  //       ),
                  //       ),
                  //   ],),
                    SizedBox(height: 10.0),
                    Row(children: [
                      Image.asset("images/car_android.png", height: 24.0, width: 24.0,),
                    SizedBox(width: 237.0,),
            
                      Container(
                        height: 40.0,
                        width: 100,
                        // child: Material(
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   shadowColor: Colors.blueAccent,
                        //   color: Colors.blue,
                        //   elevation: 7.0,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen()));
                        //     },
                        //     child: Center(
                        //       child: Text(
                        //         'Lets Go!',
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontFamily: 'Montserrat'),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                          child: ButtonBar(
                            children: <Widget>[

                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen()));
                                },
                                child: Text("Lets Go!"),),
                            ],

                            alignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,

                          )



                      ),
                      
                    
                    ])


                  ],),

               ),
              ),
         ],
        ),
        );
        }

        // void findPlace(String placeName) async{
        //   if(placeName.length > 1)
        //     String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapkey&sessiontoken=1234567890";
        //     var res = await RequestAssistant.getRequest(autoCompleteUrl);
           
                
            
        // }
        }