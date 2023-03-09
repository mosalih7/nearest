import 'package:location/location.dart';

class LocationService {
  late LocationData locationData;
  late double? latitude;
  late double? longitude;

  LocationService() {}

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // return;
      }
    }

    locationData = await location.getLocation();
    latitude = locationData.latitude;
    longitude = locationData.longitude;
    return locationData;
  }
}
