import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weadaar_app/Assistants/requestAssistant.dart';
import 'package:weadaar_app/DataHandler/appData.dart';
import 'package:weadaar_app/Models/address.dart';
//import 'package:weadaar_app/AllWidgets/configMaps.dart';

class AssistantMethods{

  // ignore: missing_return
  Future<String> searchCoordinateAddress(Position position, context)  async {
      String placeAddress = " "; 

      String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyA3v3mAFGDLaI0XVpCEE0AY8EoGhpJVsc8";
      
      var response = await RequestAssistant.getRequest(url);


      if (response != "failed"){
        placeAddress = response["results"][0]["formatted_address"];
        Address userPickupAddress = new Address();
        userPickupAddress.longitude = position.longitude;
        userPickupAddress.latitude = position.latitude;
        userPickupAddress.placeName = placeAddress;

        Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickupAddress);
      }
      return placeAddress;
  }
}