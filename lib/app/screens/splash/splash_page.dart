import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ruta_limpia/app/screens/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage ({Key?key}) :super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final _controller = SplashController(Permission.locationWhenInUse);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.checkPermission();
     });
    super.initState();
    _controller.addListener(() { 
      if (_controller.routeName !=null ) {
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}