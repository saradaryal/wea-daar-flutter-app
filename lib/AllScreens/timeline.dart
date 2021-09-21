import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weadaar_app/AllWidgets/icons.dart';
// ignore: camel_case_types



class TimeLinePage extends StatefulWidget {
  static const String idScreen = "TimeLinePage";
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: true,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.purple,
               
                padding: EdgeInsets.all(8),
              ),
              startChild: Container(
                child: Column(
                  children: [

                        SvgPicture.asset(order_processed, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "8:32 AM left on foot" ,
                      style: TextStyle(

                          fontSize: 12,
                          color: Colors.black
                      ),
                    )

                  ],
                ),
              ),
            ),

            TimelineTile(
              alignment: TimelineAlign.center,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.yellowAccent,
                padding: EdgeInsets.all(8),
               
              ),
              endChild: Container(
                child: Column(
                  children: [

                    SvgPicture.asset(order_confirmed, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Walgreenss",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "8:44 PM left 8:54 left on the bus ",
                      style: TextStyle(

                          fontSize: 12,
                          color: Colors.black
                      ),
                    )

                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.redAccent,
                padding: EdgeInsets.all(8),
                
              ),
              startChild: Container(
                child: Column(
                  children: [

                    SvgPicture.asset(order_shipped, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Madison College",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "9:30 AM - 12 PM left on a car",
                      style: TextStyle(

                          fontSize: 12,
                          color: Colors.black
                      ),
                    )

                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(8),
                
              ),
              endChild: Container(
                child: Column(
                  children: [

                    SvgPicture.asset(order_onTheWay, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Woodmans Food Market",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "12:30 PM - 9 PM left on the bus",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )

                  ],
                ),
              ),
            ),


            TimelineTile(
              alignment: TimelineAlign.center,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.teal,
                padding: EdgeInsets.all(8),

              ),
              startChild: Container(
                child: Column(
                  children: [

                    SvgPicture.asset(order_confirmed, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "BP Gas Station",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "9:30 PM - 9:37 PM left on foot",
                      style: TextStyle(

                          fontSize: 12,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
            ),

            TimelineTile(
              alignment: TimelineAlign.center,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.black,
                padding: EdgeInsets.all(8),

              ),
              endChild: Container(
                child: Column(
                  children: [

                    SvgPicture.asset(order_shipped, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Walmart SuperCenter",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "10 PM - 11:12 PM left on a car",
                      style: TextStyle(

                          fontSize: 12,
                          color: Colors.black
                      ),
                    )

                  ],
                ),
              ),
            ),

            TimelineTile(
              alignment: TimelineAlign.center,
              isLast: true,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.green,
                padding: EdgeInsets.all(8),

              ),
              startChild: Container(
                child: Column(
                  children: [
                    SvgPicture.asset(order_delivered, height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "11:52PM",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),

              ),

            ),
          ],
        ),

      ),

     
    );
  
  }
}
