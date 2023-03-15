import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
=======
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228

class RequestPermissionController{

  final Permission _locationPermission;
<<<<<<< HEAD
  final _streamController =StreamController<PermissionStatus>.broadcast();
  Stream<PermissionStatus> get onStatusChanged => _streamController.stream;
  //contructor
  RequestPermissionController(this._locationPermission);

=======

  //contructor
  RequestPermissionController(this._locationPermission);

  // Stream que se emitira a varios 
  // ignore: non_constant_identifier_names
  final _StreamController = StreamController<PermissionStatus>.broadcast();

  //*metodo
  //crear un metodo stream de tipo get => (va retornar) un stream controller utilizando un stream
  Stream<PermissionStatus> get onStatusChanged => _StreamController.stream;

  //metodo para mostrar el formulario de permiso
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
  request() async{
    final status = await _locationPermission.request();
    //metodo para emitir
    _notify(status);
  }
<<<<<<< HEAD
  
  void _notify(PermissionStatus status){
    if(!_streamController.isClosed && _streamController.hasListener){
     _streamController.sink.add(status); 
    }
  }
  

  void dispose (){
    _streamController.close();
  }
  }
=======

  void _notify(PermissionStatus status){

    // si el stream controller esta abierto
    // haslistener = para determinar si hay almenos un oyente
    if (!_StreamController.isClosed && _StreamController.hasListener ) {
      //*emitir estado del permiso al screen
      _StreamController.sink.add(status);
    }
  }

  void dispose(){
    //olvidar stream
    _StreamController.close();
  }
}
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
