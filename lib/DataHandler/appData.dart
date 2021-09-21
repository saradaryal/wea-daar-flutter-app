import 'package:flutter/cupertino.dart';
import 'package:weadaar_app/Models/address.dart';
class AppData extends ChangeNotifier{
  Address pickUpLocation;
  void updatePickUpLocationAddress(Address pickUpAddress){
    notifyListeners();
  }
}