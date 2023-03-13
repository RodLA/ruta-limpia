import 'package:flutter/material.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: 
      PreferredSize(
          preferredSize: Size.fromHeight(40.0), // here the desired height
          child: AppBar(
            leading: const BackButton(color: Colors.black,),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )
          
        ),
      body: Center(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
            padding: const EdgeInsets.only(bottom: 10.0,top: 20.0),
            child: Image.asset('assets/recycle-symbol.png')
            ),      
    
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                textAlign: TextAlign.center,
                "Es necesario activar la ubicación del dispositivo para que el equipo de Ruta Limpia puede brindarle la mejor experiencia.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                  height: 1.5
                  )  
              ),
            ),
            //Image.asset('assets/trashtruck_vistamain.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/first");
              },     
              style: ButtonStyle(            
                fixedSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 42	,202	,170)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    
                  ),
                ),
                
              ),
              child: const Text('Ubicación en tiempo real',style : TextStyle(
                color: Colors.white,
                fontSize: 18
              
              )),
              
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.center,
                "Ó",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                  height: 1.5
                  )  
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/first");
              },     
              style: ButtonStyle(            
                fixedSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 18, 184, 26)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    
                  ),
                ),
                
              ),
              child: const Text('Seleccionar ubicación',style : TextStyle(
                color: Colors.white,
                fontSize: 18
              
              )),
              
            )           
          ],
        ),     
        ),
    );
  }
}