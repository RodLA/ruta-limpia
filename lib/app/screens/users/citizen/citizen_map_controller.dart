import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:ruta_limpia/app/helpers/image_to_bytes.dart';
import 'package:ruta_limpia/app/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CitizenMapController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  Position? _initialPosition;
  CameraPosition get initialCameraPosition => CameraPosition(
      target: LatLng(_initialPosition!.latitude, _initialPosition!.longitude),
      zoom: 15);

  final _houseIcon = Completer<BitmapDescriptor>();

  bool _loading = true;
  bool get loading => _loading;

  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;

  StreamSubscription? _gpsSubscription, _positionSubscription;

  CitizenMapController() {
    _init();
  }

  Future<void> _init() async {
    final value = await imageToBytes(
        'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/home-512.png',
        width: 120,
        fromNetwork: true);
    final bitmap = BitmapDescriptor.fromBytes(value);
    _houseIcon.complete(bitmap);

    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;

    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async {
        _gpsEnabled = status == ServiceStatus.enabled;
          
        if (_gpsEnabled) {
          _initLocationUpdates();
        }
      },
    );

    _initLocationUpdates();
  }

  Future<void> _initLocationUpdates() async {
    bool initialized = false;
    await _positionSubscription?.cancel();
    _positionSubscription = Geolocator.getPositionStream().listen(
      (position) {
        if (!initialized) {
          _setInitialPosition(position);
          initialized = true;
          notifyListeners();
        }
      },
      onError: (e) {
        if (e is LocationServiceDisabledException) {
          _gpsEnabled = false;
          notifyListeners();
        }
      },
    );
  }

  void _setInitialPosition(Position position) {
    if (_gpsEnabled && _initialPosition == null) {
      _initialPosition = position;
    }
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  Future<void> turnOnGPS() async {
    Geolocator.openLocationSettings();
  }

  void onTap(LatLng position) async {
    final id = MarkerId(_markers.length.toString());
    final icon = await _houseIcon.future;
    final marker = Marker(
      markerId: id,
      position: position,
      draggable: true,
      icon: icon,
      onTap: () {
        _markersController.sink.add(id.value);
      },
    );
    _markers.clear(); // Limpiar los marcadores anteriores
    _markers[id] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _gpsSubscription?.cancel();
    _markersController.close();
    super.dispose();
  }
}
