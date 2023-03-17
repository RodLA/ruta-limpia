
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:ruta_limpia/app/routes/routes.dart';
import 'package:ruta_limpia/app/routes/pages.dart';
import 'package:flutter/material.dart'; 
import 'package:page_transition/page_transition.dart';
import 'package:ruta_limpia/app/screens/users/home/first.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return AnimatedSplashScreen(
    splash: Image.asset(
      'assets/trash_truck.png',
      width: 250.0,
      height: 250.0,
    ),
    nextScreen: HomePage(),
    splashTransition: SplashTransition.fadeTransition,
    pageTransitionType: PageTransitionType.bottomToTop,
    backgroundColor: Color.fromARGB(255, 42, 202, 170),
    duration: 3000,
  );
}

}