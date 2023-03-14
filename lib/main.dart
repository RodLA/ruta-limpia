import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rutalimpia_frontend/common/load_page.dart';
import 'package:rutalimpia_frontend/screens/first_screen.dart';
import 'package:rutalimpia_frontend/screens/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rutalimpia_frontend/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      AnimatedSplashScreen(
        splash: Image.asset(
          'assets/trashtruck.png',
        ),
        nextScreen: const HomePage() ,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: const Color.fromARGB(255, 27, 185, 34),
        duration: 6000,
      ),
      routes: {
        '/first' :(context) => const firstscreen(),
        '/login' :(context) => const loginsreen(),
        '/load' :(context) => const loadingpage()

      }
      
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
  
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
  }
}

