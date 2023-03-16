import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:ruta_limpia/app/helpers/image_to_bytes.dart';
import 'package:ruta_limpia/app/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//?para que se actualice los markers se extendera ChangeNotifier
class CitizenMapController extends ChangeNotifier {
// Variable para controlar si se ha creado un marcador

  //! VAR
  final Map<MarkerId,Marker>  _markers = {};
  
  //convertir de un iterable marker a un set marker, devuelve una lista set de markers
  //retornar set de tipo marker - obtener => del objeto.values y convertir a set.
  //? metodo markers
  Set<Marker> get markers => _markers.values.toSet();

  //? stream de difusion (BROADCAST)
  final _markersController = StreamController< String >.broadcast();
  //? Stream son como obserbables. para emitir y escuchar data.
  Stream<String> get onMarkerTap => _markersController.stream;
  
  final initialCameraPosition = const CameraPosition(
    target: LatLng(-12.033120, -77.100181),
    zoom: 15
  );

  final _houseIcon = Completer<BitmapDescriptor>();
  CitizenMapController(){
    //'assets/house.png', width: 120, fromNetwork: false
    //'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/home-512.png',width: 120,fromNetwork: true
    imageToBytes(
      'assets/house.png',
      width: 120,
    ).then((value) {
      final bitmap = BitmapDescriptor.fromBytes(value);
      _houseIcon.complete(bitmap);
    } );
  }

  //! METHODS
  void onMapCreated(GoogleMapController controller){
    controller.setMapStyle( mapStyle );
  }

  //method async por el fromAssetImage
 void onTap(LatLng position) async {
  if (_markers.isEmpty) { // verifica si no hay marcadores
    final id = _markers.length.toString();
    final markerId = MarkerId(id);

    final icon = await _houseIcon.future;

    final marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      icon: icon,
      onTap: () {
        _markersController.sink.add(id);
      },
    );

    _markers[markerId] = marker;

    notifyListeners();
  }
}

  @override
  void dispose() {
    //? cerrar el stream (emicion de data)
    //?cuando el screen de citizenController sea destruido se liberara el market controller
    _markersController.close();
    super.dispose();
  }
}