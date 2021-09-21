
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weadaar_app/AllScreens/currWeather.dart';
import 'package:weadaar_app/AllScreens/insurance.dart';
import 'package:weadaar_app/AllScreens/searchScree.dart';
import 'package:weadaar_app/AllScreens/timeline.dart';
//import 'package:weadaar_app/AllScreens/loginScreen.dart';
import 'package:weadaar_app/AllWidgets/Divider.dart';
import 'package:weadaar_app/Assistants/assistantMethods.dart';
import 'package:weadaar_app/DataHandler/appData.dart';

class MainScreen extends StatefulWidget {
   static const String idScreen = "MainScreen";
  @override 
  _MainScreenState createState() => _MainScreenState();
  }
  
  class _MainScreenState extends State<MainScreen>{
    Completer<GoogleMapController> _controllerGoogleMap = Completer();
    GoogleMapController newGoogleMapController;

    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    Position currentPosition;
    var geoLocator = Geolocator();
    double bottomPaddingOfMap = 0;
    void locatePosition() async{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentPosition= position;

      LatLng latLatPosition = LatLng(position.latitude, position.longitude);
      
      CameraPosition cameraPosition = new CameraPosition(target: latLatPosition, zoom: 14);
      newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      String address = await AssistantMethods().searchCoordinateAddress(position, context);
        print("This is your Address  :: " + address);
    }

    static final CameraPosition _kGooglePlex = CameraPosition(               
    target: LatLng(44.798378, 44.798378),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text("Hello"),
      // ),
     
      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset("images/user_icon.png", height: 65.0, width: 65.0,),
                      SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Profile Name", style: TextStyle(fontSize: 16.0),),
                          SizedBox(height: 6.0,),
                          Text("Visit Profile"),
                        ],

                      ),
                    ], //children
                  )
                )
              ),
           
              SizedBox(height: 12.0),
             //drawer body controller

            GestureDetector(
              onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLinePage()));
                  },
              child: ListTile(
                leading: Icon(Icons.timeline),
                title: Text("View Timeline", style: TextStyle(fontSize: 15.0),),
              ),
            ),

            GestureDetector(
                 onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InsuranceScreen()));
                  },
                child: ListTile(
                leading: Icon(Icons.insert_chart_outlined_sharp),
                title: Text("Insurance Info", style: TextStyle(fontSize: 15.0),),
              ),
            ),

             ListTile(
              leading: Icon(Icons.warning_amber_outlined),
              title: Text("Need Help", style: TextStyle(fontSize: 15.0),),
            ),
             
          ListTile(
              leading: Icon(Icons.settings),
              title: Text("App Setings", style: TextStyle(fontSize: 15.0),),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us", style: TextStyle(fontSize: 15.0),),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact Us", style: TextStyle(fontSize: 15.0),),
            ),

            ],
          ),
        ),
      ) ,
    body: Stack(
      children: [
        GoogleMap(
          padding: EdgeInsets.fromLTRB(5.0, 50, 5.0, 280),
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            setState(() {
              bottomPaddingOfMap = 100.0;
            });

            locatePosition();

          },
        ),
    //hamburger button for drawer
      Positioned(
        top: 45.0,
        left: 22.0,
        child: GestureDetector(
          onTap: (){
            scaffoldKey.currentState.openDrawer();
          },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.0),
            boxShadow:[
              BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                spreadRadius: 0.5,
                offset: Offset(
                  0.7,
                  0.7,
                ),
                ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.menu, color: Colors.black,),
            radius: 20.0,
          ),
        ),
      ),
      ),
       
          
              Positioned(
              height: 25.0,
              left: 20.0,
              right: 350.0,
              bottom: 290.0,

              child: GestureDetector(
                onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentWeather()));
                },
             child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow:[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: Offset(
                      0.7,
                      0.7,
                    ),
                    ),
                ],
              ),
         
                child: Image(
                  image: AssetImage("images/weather.png"),
                  width: 20.0,
                  height: 20.0,
                  alignment: Alignment.center,
                  ),
          ),
              ),
      ),
      
  
       
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom:0.0,
          child: Container(
              height: 270.0,
              decoration: BoxDecoration(
               color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 16.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7),
                ),
              ],
              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              SizedBox(height: 6.0),
              Text("Hey There!", style: TextStyle (fontSize: 12.0),),
              Text("Where To?", style: TextStyle (fontSize: 20.0),), 
              SizedBox(height: 20.0),
              
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                  
                   child: Container(
                  decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
                ), 
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                  Icon(Icons.search, color: Colors.blueAccent,),
                  SizedBox(width: 15.0,),
                  Text("Search Where You Want To Go")

                ],
                ),
                ),
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  Icon(Icons.home, color: Colors.grey,),
                  SizedBox(width: 12.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<AppData>(context).pickUpLocation != null
                        ? Provider.of<AppData>(context).pickUpLocation.placeName : "Add Home"
                        ),
                    
                      SizedBox(height: 4.0,),
                      Text("Home Address", style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                    ],
                  ),

                ],

              ),
                 SizedBox(height: 10.0),
              DividerWidget(),
              SizedBox(height: 16.0),
              
              Row(
                children: [
                  Icon(Icons.work, color: Colors.grey,),
                  SizedBox(width: 12.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add Work"),
                      SizedBox(height: 4.0,),
                      Text("Work Address", style: TextStyle(color: Colors.black54, fontSize: 12.0),),
                    ],
                  ),

                ],

              ),
            
            
            
            ],
            ),
          ),
          ),
          
          
          ),
      ],

    ),
    );
  }
  }
    
