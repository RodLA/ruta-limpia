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
                'Para calcular la mejor ruta del camión de basura cerca a su hogar es necesario conocer su ubicación. .',
                textAlign: TextAlign.center, // Centra el texto horizontalmente
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // aquí va el botón 
                _controller.request();
              },
              style: ButtonStyle(
                //backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 54, 93, 69)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorsMyApp.primarycolor),
              ),
              child: const Text('Permitir el acceso a mi ubicación actual', style: TextStyle(color: Colors.white),),
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
              child: const Text('Seleccionar mi ubicación actual', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
