import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({super.key});

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 42, 202, 170),
        body:Center(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [      
            const SizedBox(height: 250.0,),
           //AHORRAR PADDING XD
            SizedBox(
            width: 200.0,
            height: 300.0,
            child: Image.asset('assets/camion_new.png')
            ), 
            //AHORRAR PADDING XD
            const SizedBox(height: 100.0,),
           //ANIMACION LOGIN
            SizedBox(
              child:Center(   
              child: SpinKitFadingCircle(
              size: 50.0,
              itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10) ,
                  color: index.isEven ? const Color.fromARGB(255, 255, 255, 254) : const Color.fromARGB(255, 0, 0, 0),
                ),
              );
              },
              ),
              ),
            ),         
          ],   
        ),  
        ),
        ),
    );
  }
}