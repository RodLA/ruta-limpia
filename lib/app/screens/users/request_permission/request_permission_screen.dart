import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ruta_limpia/app/routes/routes.dart';
import 'package:ruta_limpia/app/screens/users/request_permission/request_permission_controller.dart';

import '../../../const/colors.dart';

class RequestPermissionScreen extends StatefulWidget {
  const RequestPermissionScreen({super.key});

  @override
  State<RequestPermissionScreen> createState() =>
      _RequestPermissionScreenState();
}

class _RequestPermissionScreenState extends State<RequestPermissionScreen> with WidgetsBindingObserver {
  //retornar una instancia de la clase PermissionWithService
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  //late se utiliza para las variables que se inicializaran luego.
  late StreamSubscription _subscription;
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    //*escucha los cambios en el permiso de ubicacion del controlador
    _subscription = _controller.onStatusChanged.listen((status) {
      
      switch (status) {
        case PermissionStatus.granted:
          _goToHome();
          break;
        case PermissionStatus.permanentlyDenied:
          //si el permiso fue denegado se le enviara ala configuracion del aplicativo
          showDialog(context: context, builder: (_) => AlertDialog(
            title: const Text("INFO"),
            content: const Text("No se pudo acceder a la ubicacion del dispositio"),
              actions: [
                TextButton(onPressed: () async {
                  Navigator.pop(context);
                  _fromSettings = await openAppSettings();
                }, child: const Text("Ir a configuraciones",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),

                TextButton(onPressed: (){
                  Navigator.pop(context); 
                }, child: const Text("Cancelar",
                style: TextStyle(
                    color: Colors.black,
                  ),
                ))
              ],
          ) );
          break;

        default:
      }
    });
  }

  

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //si la aplicacion vuelve de ajustes
    if (state == AppLifecycleState.resumed && _fromSettings) {
      final status = await _controller.check();
      if(status == PermissionStatus.granted){
        _goToHome();
      }
    }
    _fromSettings = false;
    
  }

  void _goToHome(){
    Navigator.pushReplacementNamed(context, Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30.0), // Agrega un margen
              alignment: Alignment
                  .center, // Centra el texto vertical y horizontalmente
              child: const Text(
                'Es necesario activar la ubicación del dispositivo para que el equipo de Ruta Limpia pueda brindarle la mejor experiencia.',
                textAlign: TextAlign.center, // Centra el texto horizontalmente
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.request();
              },
              style: ButtonStyle(
                //backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 54, 93, 69)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorsMyApp.primarycolor),
              ),
              child: const Text('Permitir acceso a mi ubicación'),
            ),
            const Text('ó'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, Routes.MAP_SELECT_HOUSE);
              },
              style: ButtonStyle(
                //backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 54, 93, 69)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color.fromARGB(0, 42, 202, 170)),
              ),
              child: const Text('Seleccionar mi ubicación'),
            ),
          ],
        ),
      ),
    );
  }
}