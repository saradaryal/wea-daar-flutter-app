// import 'package:flutter/material.dart';
// //import 'package:weadaar_app/AllScreens/mainscreen.dart';
// //import 'package:weadaar_app/AllWidgets/Divider.dart';
// // import 'package:provider/provider.dart';
// // import 'package:weadaar_app/AllWidgets/Divider.dart';
// // import 'package:weadaar_app/AllWidgets/configMaps.dart';
// // import 'package:weadaar_app/Assistants/requestAssistant.dart';
// // import 'package:weadaar_app/DataHandler/appData.dart';
// //import 'package:provider/provider.dart';
// //import 'package:weadaar_app/DataHandler/appData.dart';
//
// class WeatherScreen extends StatefulWidget {
//    static const String idScreen = "WeatherScreen";
//   @override
//   _WeatherScreenState createState() => new _WeatherScreenState();
// }
//
// class _WeatherScreenState extends State<WeatherScreen> {
//
//   TextEditingController pickUpTextEditingController = TextEditingController();
//   TextEditingController dropOffTextEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//   // String placeAddress = Provider.of<AppData>(context).pickUpLocation.placeName ?? "";
//     //pickUpTextEditingController.text = placeAddress;
//     return Scaffold(
//         body: Column(
//          children: [
//            Container(
//              height: 700.0,
//              decoration: BoxDecoration(
//                color: Colors.white,
//                boxShadow: [
//                  BoxShadow(color: Colors.black,
//                  blurRadius: 6.0,
//                  spreadRadius: 0.5,
//                  offset: Offset(0.7,0.7),
//                  ),
//                ],
//              ),
//               child: Padding (
//                 padding: EdgeInsets.only(left: 25.0, top: 40.0, right: 25.0, bottom: 20.0),
//                 child: Column (children: [
//                   SizedBox(height: 5.0),
//                   Stack(
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                           child: Icon(
//                           Icons.arrow_back
//                         ),
//                       ),
//                       Center(
//                         child: Text("Madison, WI --> Eau Claire, WI", style: TextStyle(fontSize: 24.0,))
//                       )
//
//                     ],),
//                   ],),
//
//               ),
//               ),
//               SizedBox(height: 10),
//       Container(
//         child: ButtonBar(
//           children: <Widget>[
//             // ignore: deprecated_member_use
//
//             // ignore: deprecated_member_use
//             FlatButton(onPressed: (){
//
//             },
//
//              child: Text("Recommended Round Trip",)),
//
//               // ignore: deprecated_member_use
//               RaisedButton(
//               onPressed: () {
//              },
//             child: Text("Lets Go!"),),
//           ],
//           alignment: MainAxisAlignment.spaceAround,
//           mainAxisSize: MainAxisSize.max,
//
//         )
//       )
//
//
//          ],
//
//
//          ));
//   }
//         }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

//
// class WeatherScreen extends StatefulWidget {
//   static const String idScreen = "WeatherScreen";
//   @override
//   _WeattherScreenState createState() => _WeatherScreenState();
// }
class WeatherScreen extends StatefulWidget {
     static const String idScreen = "WeatherScreen";
     @override
     _WeatherScreenState createState() => new _WeatherScreenState();
   }


class _WeatherScreenState extends State<WeatherScreen> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(200), blurRadius: 30.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),

                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["price"],
                      style: const TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "images/${post["image"]}",
                  height: 80, width: 60,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        // ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50,),

                  Text(
                    "Eau Claire, WI --> Madison, WI",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tomorrow",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: 2Hours 36mins to 2Hours 41mins",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "High: 65°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Low: 45°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Road: Slipery!",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Saturday",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Time: 2 Hours 36 mins to 3 Hours 10 mins",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "High: 81°F ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "Low: 65°F ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                         "Road: Perfect!",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sunday",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: 2 Hours 36 mins to 3 Hours 14 mins",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "High: 81°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Low: 67°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Road: Perfect!",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Monday",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: 2 Hours 36 mins to 3 Hours 14 mins",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "High: 81°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Low: 67°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Road: Slipery!",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tuesday",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: 2 Hours 36 mins to 3 Hours 24 mins",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "High: 81°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Low: 67°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Road: Slipery!",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Wednday",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: 2 Hours 36 mins to 3 Hours 34 mins",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "High: 81°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Low: 67°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Road: Slipery!",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Thursday",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: 2 Hours 36 mins to 2 Hours 544 mins",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "High: 81°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Low: 67°F ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Road: Slipery!",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}










