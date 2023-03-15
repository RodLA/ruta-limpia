import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class RequestPermissionController{

  final Permission _locationPermission;
  final _streamController =StreamController<PermissionStatus>.broadcast();
  Stream<PermissionStatus> get onStatusChanged => _streamController.stream;
  //contructor
  RequestPermissionController(this._locationPermission);

  request() async{
    final status = await _locationPermission.request();
    //metodo para emitir
    _notify(status);
  }
  
  void _notify(PermissionStatus status){
    if(!_streamController.isClosed && _streamController.hasListener){
     _streamController.sink.add(status); 
    }
  }
  

  void dispose (){
    _streamController.close();
  }
  }
