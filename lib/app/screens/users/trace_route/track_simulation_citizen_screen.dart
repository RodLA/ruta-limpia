import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import '../../../const/colors.dart';
import '../../../helpers/image_to_bytes.dart';

class TrackSimulationCitizenScreen extends StatefulWidget {
  const TrackSimulationCitizenScreen({super.key});

  @override
  State<TrackSimulationCitizenScreen> createState() =>
      _TrackSimulationCitizenScreenState();
}

class _TrackSimulationCitizenScreenState
    extends State<TrackSimulationCitizenScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  Position? _initialPosition, _lastPosition;

  StreamSubscription? _gpsSubscription, _positionSubscription;
  GoogleMapController? _mapController;
  

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      -12.226115, -76.940835
    ),
    zoom: 15.4,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  late BitmapDescriptor _carPin;
  late BitmapDescriptor _housePin;

  // List<LatLng> latlng = [
  //   const LatLng(-12.225956, -76.941367),
  //   const LatLng(-12.229553, -76.947685),
  //   const LatLng(-12.234776, -76.944534),
  //   const LatLng(-12.235279, -76.944146),
  //   const LatLng(-12.237017, -76.943103),
  //   const LatLng(-12.239320, -76.938510),
  //   const LatLng(-12.239281, -76.938418),
  //   const LatLng(-12.239457, -76.938058),
  //   const LatLng(-12.238096, -76.937146),
  // ];

  //-12.234418, -76.935506

  List<LatLng> latlng = [
    const LatLng(-12.213376, -76.937102),
    const LatLng(-12.218347, -76.945635),
    const LatLng(-12.232276, -76.937357),
    const LatLng(-12.232676, -76.937002),
    const LatLng(-12.234230, -76.934815),
    const LatLng(-12.237511, -76.937215),
  ];

  List<String> images = [
    'assets/house.png',
  ];

  //?metodo para convertir imagen en bytes
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();

    addMarkerHouse();
    getCarImage();
    addRoute();
    
  }

  addMarkerHouse() async {
    // final Uint8List markerIcon =
    //     await getBytesFromAsset("assets/house.png", 80);
    _housePin = BitmapDescriptor.fromBytes(
      await imageToBytes('assets/house.png',width: 60),
    );

    _markers.add(Marker(
        markerId: const MarkerId("House"),
        position: const LatLng(-12.234418, -76.935506),
        icon: _housePin,
        infoWindow: const InfoWindow(title: 'Mi casa')));

    setState(() {});
  }

  getCarImage() async{
    _carPin = BitmapDescriptor.fromBytes(
      await imageToBytes('assets/trash-truck-white.png',width: 60),
    );

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
    );

    await _positionSubscription?.cancel();
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: locationSettings
    ).listen(
      (position) async {

        _setMyPositionMarker(position);
        //notifyListeners();
        if (_mapController != null) {
          final zoom = await _mapController!.getZoomLevel();
          final cameraUpdate = CameraUpdate.newLatLngZoom(
            LatLng(position.latitude, position.longitude),
            zoom,
          );
          _mapController!.animateCamera(cameraUpdate);
        }
      },
      onError: (e){
      },
    );
  }
  
  void _setMyPositionMarker(Position position){
    double rotation = 0;

    if (_lastPosition != null) {
    rotation = Geolocator.bearingBetween(
        _lastPosition!.latitude, 
        _lastPosition!.longitude,
        position.latitude, 
        position.longitude
      );   
    }else{
      _initialPosition = position;
    }

    // const markerId = MarkerId('my-position');
    // final marker = Marker(
    //   markerId: markerId,
    //   position: LatLng(position.latitude, position.longitude),
    //   icon: _carPin,
    //   anchor: const Offset(0.5, 0.5),
    //   rotation: rotation
    // );
    // _markers[markerId] = marker;
    // _lastPosition = position;

    _markers.add(Marker(
        markerId: const MarkerId("Camion de basura"),
        position: LatLng(position.latitude, position.longitude),
        icon: _carPin,
        infoWindow: const InfoWindow(title: 'Mi casa'),
        anchor: const Offset(0.5, 0.5), 
        rotation: rotation
        ));
    _lastPosition = position;
    setState(() {});
  }

  addRoute(){
    for (int i = 0; i < latlng.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(
            i.toString(),
          ),
          position: latlng[i],
          infoWindow: const InfoWindow(
            title: "Punto de recojo de basura",
            snippet: "10 min aprox de recojo",
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      setState(() {});
      _polyline.add(
        Polyline(
          polylineId: const PolylineId('1'),
          points: latlng,
          color: ColorsMyApp.primarycolor,
          width: 8,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        polylines: _polyline,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationButtonEnabled: true,
      ),
    );
  }
}
