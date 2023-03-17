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

  //convertir de un iterable marker a un set marker, devuelve una lista set de markers
  //retornar set de tipo marker - obtener => del objeto.values y convertir a set.
  //? metodo markers
  Set<Marker> get markers => _markers.values.toSet();

  //? stream de difusion (BROADCAST)
  final _markersController = StreamController<String>.broadcast();
  //? Stream son como obserbables. para emitir y escuchar data.
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
    //?imagen marker
    //'assets/house.png', width: 120, fromNetwork: false
    final value = await imageToBytes(
        'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/home-512.png',
        width: 120,
        fromNetwork: true);
    final bitmap = BitmapDescriptor.fromBytes(value);
    _houseIcon.complete(bitmap);

    //inicializando
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    //escuchar cuando gps se prende o apaga

    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async {
        print("aquixd");
        _gpsEnabled = status == ServiceStatus.enabled;
          
        if (_gpsEnabled) {
          _initLocationUpdates();
        }
    });

    _initLocationUpdates();
  }

  Future<void> _initLocationUpdates() async{

    print("aquixd update");

    bool initialized = false;
    await _positionSubscription?.cancel();
    _positionSubscription = Geolocator.getPositionStream().listen(
      (position) {
        print(" position xd $position");
        if (!initialized) {
          print(" init $position");
          _setInitialPosition(position);
          initialized = true;
          notifyListeners();
        }
      },
    onError: (e){
      print("on Error ${e.runtimeType}");
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

  //! METHODS
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  Future<void> turnOnGPS() async {
    Geolocator.openLocationSettings();
  }

  //method async por el fromAssetImage
  void onTap(LatLng position) async {
    final id = _markers.length.toString();
    //constructor markerID
    final markerId = MarkerId(id);

    final icon = await _houseIcon.future;

    //*Usa el constructor marker para llenar la variable
    final marker = Marker(
      markerId: markerId,
      position: position,

      //*Para mover el marker
      draggable: true,
      icon: icon,

      //*envia un emit del ID a la vista cuando se le da click al icono
      onTap: () {
        _markersController.sink.add(id);
      },
    );

    //*A la lista de markers en la posicion del ID se le agregara el obj marker creado
    _markers[markerId] = marker;

    //?para llamar a actualizar los markers de la pagina SCREENS
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
