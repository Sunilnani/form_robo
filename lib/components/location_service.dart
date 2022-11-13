
import 'package:location/location.dart';

class LocationService {

  Future<LocationData?> getLocation() async {
    var location = Location();

    var _serviceEnabled = false;
    var _permissionGranted = PermissionStatus.denied;
    LocationData? _locationData;

    try {

      _serviceEnabled = await location.serviceEnabled();
    } catch(err) {}
    if (!_serviceEnabled) {
//      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    try {
      _permissionGranted = await location.hasPermission();
    } catch(err) {}
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    try {
      _locationData = await location.getLocation();
    } catch(err) {}
    return _locationData;
  }

}

final LocationService locationService = LocationService();
