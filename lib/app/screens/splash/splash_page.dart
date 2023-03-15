<<<<<<< HEAD

=======
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ruta_limpia/app/screens/splash/splash_controller.dart';

<<<<<<< HEAD
class SplashPage extends StatefulWidget {
  const SplashPage ({Key?key}) :super(key: key);
=======
import '../../const/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

<<<<<<< HEAD
  final _controller = SplashController(Permission.locationWhenInUse);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.checkPermission();
     });
    super.initState();
    _controller.addListener(() { 
      if (_controller.routeName !=null ) {
=======
  //locationWhenInUse permiso de la ubicacion de l usuario cuando la app esta en uso
  final _controller = SplashController(Permission.locationWhenInUse);

  @override
  void initState() {
    super.initState();

    //para que renderice por lo menos una vez el splashpage
    //addPostFrameCallback() es un método que se utiliza para agregar una devolución 
    //de llamada que se ejecutará después de que se dibuje el marco de la interfaz de usuario.
    //esperar a que se dibuje la interfaz de usuario de la pantalla antes de verificar el permiso de ubicación del usuario.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _controller.checkPermission();
      }
    );

    //para escuchar el cambio del controlller
    _controller.addListener(() {
      if(_controller.routeName != null){
        // el simbolo ' ! ' es para indicar que el resultado no sera nulo y no se comprobara
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });
  }
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
=======

  //mientras se muestra lo siguiente, la aplicacion va analizar los permisos
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: ColorsMyApp.primarycolor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text(
                "Cargando...",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
>>>>>>> 01029af0622afc47e8f7e722ff51954a948c7228
  }
}