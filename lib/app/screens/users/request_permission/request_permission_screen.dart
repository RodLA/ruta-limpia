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

class _RequestPermissionScreenState extends State<RequestPermissionScreen> {
<<<<<<< HEAD
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
@override
  void initState() { 
    super.initState();
    _subscription= _controller.onStatusChanged.listen((status) {
        if(status==PermissionStatus.granted){
          Navigator.pushReplacementNamed(context, Routes.HOME);
        }
     },);
  }
  @override
  void dispose(){
    _subscription.cancel();
    _controller.dispose();
    super.dispose();

  }







// Aqui comienza el estilo
=======
  //retornar una instancia de la clase PermissionWithService
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  //late se utiliza para las variables que se inicializaran luego.
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    //*escucha los cambios en el permiso de ubicacion del controlador
    _subscription = _controller.onStatusChanged.listen((status) {
      if (status == PermissionStatus.granted) {
        Navigator.pushReplacementNamed(context, Routes.HOME);
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
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
<<<<<<< HEAD
                // aquí va el botón 
=======
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
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
