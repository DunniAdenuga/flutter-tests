import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WidgetList {
  Widget buildCurrentLocationButton(mapController, currentPosition) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomRight,
            child: ClipOval(
              child: Material(
                color: Colors.orange[100], // button color
                child: InkWell(
                  splashColor: Colors.orange, // inkwell color
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Icon(Icons.my_location),
                  ),
                  onTap: () {
                    // TODO: Add the operation to be performed
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                            currentPosition.latitude,
                            currentPosition.longitude,
                          ),
                          zoom: 18.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
      );

  Widget buildZoomInOutButton(mapController) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.blue[100], // button color
                    child: InkWell(
                      splashColor: Colors.blue, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.add),
                      ),
                      onTap: () {
                        // TODO: Add the operation to be performed
                        // on button tap
                        // Zoom In action
                        mapController.animateCamera(
                          CameraUpdate.zoomIn(),
                        );
                      },
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.blue[100], // button color
                    child: InkWell(
                      splashColor: Colors.blue, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.remove),
                      ),
                      onTap: () {
                        // TODO: Add the operation to be performed
                        // on button tap
                        // // Zoom Out action
                        mapController.animateCamera(
                          CameraUpdate.zoomOut(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
      );

  Widget buildShowRouteButton (startController, endController, width) => Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        children: [

          _buildTextField(startController, width),

          _buildTextField(endController, width),

          ElevatedButton(
              onPressed: null,
              style: ButtonStyle
                (backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
              child: Text("Show Route",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,)
          ),
        ],
      ),
    ),
  );

  Widget _buildTextField(controller, width) => Container(
    width: width*0.8,
    child: TextField(
    controller: controller,
    onChanged: (value){
    },
    decoration: new InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: Colors.grey[400],
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue[300],
          width: 2,
        ),
      ),

      ),

    ),

  );
}
