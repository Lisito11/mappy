import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


CameraPosition _initialPosition = CameraPosition(target: LatLng(18.735693, -70.162651),zoom: 8);
Completer<GoogleMapController> _controller = Completer();

final Set<Marker> _markers = Set();
final double _zoom = 10;

void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}

class MapScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const MapScreen({Key? key, required this.data}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
              markers: {Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(widget.data['lat'], widget.data['long']),
                  infoWindow: InfoWindow(title: 'Higuey, RD.')
              ),}
            ),
          ],
        ));
  }

}

