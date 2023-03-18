import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:ruta_limpia/app/helpers/image_to_bytes.dart';
import 'package:ruta_limpia/app/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

//?para que se actualice los markers se extendera ChangeNotifier
class CitizenMapController extends ChangeNotifier {
  //! VAR
  final Map<MarkerId, Marker> _markers = {};
  final Map<PolylineId, Polyline> _polylines = {};
  final Map<PolygonId, Polygon> _polygons = {};

  //convertir de un iterable marker a un set marker, devuelve una lista set de markers
  //retornar set de tipo marker - obtener => del objeto.values y convertir a set.
  //? metodo markers
  Set<Marker> get markers => _markers.values.toSet();
  Set<Polyline> get polylines => _polylines.values.toSet();
  Set<Polygon> get polygons => _polygons.values.toSet();

  late BitmapDescriptor _carPin;
  

  //? stream de difusion (BROADCAST)
  final _markersController = StreamController<String>.broadcast();
  //? Stream son como obserbables. para emitir y escuchar data.
  Stream<String> get onMarkerTap => _markersController.stream;

  Position? _initialPosition, _lastPosition;
  Position? get initialPosition => _initialPosition;

  bool _loading = true;
  bool get loading => _loading;

  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;

  StreamSubscription? _gpsSubscription, _positionSubscription;
  GoogleMapController? _mapController;

  String _polylineId = '0';
  String _polygonId = '0';

  CitizenMapController() {
    _init();
  }

  Future<void> _init() async {
    
    _carPin = BitmapDescriptor.fromBytes(
      await imageToBytes('assets/trash-truck-white.png',width: 60),
    );

    //inicializando
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    //escuchar cuando gps se prende o apaga

    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async {

        _gpsEnabled = status == ServiceStatus.enabled;
          
        if (_gpsEnabled) {
          _initLocationUpdates();
        }
      }
    );

    _initLocationUpdates();
  }

  Future<void> _initLocationUpdates() async{

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
    );

    bool initialized = false;
    await _positionSubscription?.cancel();
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: locationSettings
    ).listen(
      (position) async {

        _setMyPositionMarker(position);
        if(initialized){
          notifyListeners();
        }

        if (!initialized) {
          
          _setInitialPosition(position);
          initialized = true;
          notifyListeners();
        }

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
        if(e is LocationServiceDisabledException){
          _gpsEnabled = false;
          notifyListeners();
        }
      },
    );
  }

  void _setInitialPosition( Position position ) {
    if (_gpsEnabled && _initialPosition == null) {
      //ultima ubicacion conocida del dispositivo
      _initialPosition = position;
      //depende que el gps este prendido
      // _initialPosition = await Geolocator.getCurrentPosition();
    }
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
    }
  
    const markerId = MarkerId('my-position');
    final marker = Marker(
      markerId: markerId,
      position: LatLng(position.latitude, position.longitude),
      icon: _carPin,
      anchor: const Offset(0.5, 0.5),
      rotation: rotation
    );
    _markers[markerId] = marker;
    _lastPosition = position;
  }

  //! METHODS
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
    _mapController = controller;
  }

  Future<void> turnOnGPS() => Geolocator.openLocationSettings();

  void newPolyline(){
    _polylineId = DateTime.now().millisecondsSinceEpoch.toString();
  }
  void newPolygon(){
    _polygonId = DateTime.now().millisecondsSinceEpoch.toString();
  }

  //method async por el fromAssetImage
  void onTap(LatLng position) async {

    // final polylineId = PolylineId(_polylineId);
    // late Polyline polyline;

    // if (_polylines.containsKey(polylineId)) {
    //   final tmp = _polylines[polylineId]!;
    //   polyline = tmp.copyWith(pointsParam: [...tmp.points,position],);
    // }else{
    //   final color = Colors.primaries[_polylines.length];
    //   polyline = Polyline(polylineId: polylineId, 
    //     points: [position],
    //     width: 10,
    //     color: color,
    //     startCap: Cap.roundCap,
    //     endCap: Cap.roundCap,
    //     patterns: [
    //       PatternItem.dot,
    //       PatternItem.gap(10)
    //     ]
    //   ); 
    // }

    // _polylines[polylineId] = polyline;

    //?poligonos
    final PolygonId polygonId = PolygonId(_polygonId);
    late Polygon polygon;

    if (_polygons.containsKey(polygonId)) {
      final tmp = _polygons[polygonId]!;
      polygon = tmp.copyWith(
        pointsParam: [...tmp.points, position]
      );
    }else{
      final color = Colors.primaries[_polygons.length];
      polygon = Polygon(
        polygonId: polygonId, 
        points: [position],
        fillColor: color.withOpacity(0.4)
      );
    }

    _polygons[polygonId] = polygon;

    notifyListeners();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _gpsSubscription?.cancel();
    //? cerrar el stream (emicion de data)
    //?cuando el screen de citizenController sea destruido se liberara el market controller
    _markersController.close();
    super.dispose();
  }
}
