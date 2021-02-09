import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_widgets.dart';

// inspired from
// https://medium.com/flutter-community/flutter-creating-a-route-calculator-using-google-maps-71699dd96fb9

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  var mapWidgetList = new WidgetList();
  GoogleMapController mapController;
  final Geolocator _geoLocator = Geolocator();
  // For storing the current position
  Position _currentPosition;
  final LatLng _initialCenter = const LatLng(0.0, 0.0);
  TextEditingController startAddress;
  TextEditingController destinationAddress;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await _geoLocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    // Determining the screen width & height
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // TODO: Add Map View
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialCenter,
                zoom: 2.0,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
            ),

            mapWidgetList.buildCurrentLocationButton(mapController, _currentPosition),

           mapWidgetList.buildZoomInOutButton(mapController),

            mapWidgetList.buildShowRouteButton(startAddress, destinationAddress, width)


          ],
        ),
      ),
    );
  }



}