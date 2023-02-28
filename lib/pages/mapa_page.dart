import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrreaderfer/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageScreen extends StatefulWidget {
  const MapPageScreen({Key? key}) : super(key: key);

  @override
  State<MapPageScreen> createState() => _MapPageScreenState();
}

class _MapPageScreenState extends State<MapPageScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanResultModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanResultModel;

    final CameraPosition firstPoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746,
    );

    const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 17.151926040649414,
    );

    Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller
                  .animateCamera(CameraUpdate.newCameraPosition(firstPoint));
            },
            icon: const Icon(Icons.location_history),
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType,
        initialCameraPosition: firstPoint,
        markers: markers,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Change layer');
          if(mapType == MapType.normal){
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() { });
         },
        child: const Icon(Icons.layers),
      ),
    );
  }
}
