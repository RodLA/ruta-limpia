import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:permission_handler/permission_handler.dart';
import 'package:ruta_limpia/app/routes/routes.dart';

class SplashController extends ChangeNotifier{

  //variables y metodo para get de route name
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  //constructor
  SplashController(this._locationPermission);

  //metodo que devulve una promesa (future) para evaluar el permiso
  Future<void> checkPermission() async{
    //si el permiso a sido concedido (booleano)
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? Routes.FIRST : Routes.PERMISSIONS; 
    
    //para notificar el cambio a splash_page
    notifyListeners();
  }
}