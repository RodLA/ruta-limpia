import 'package:flutter/material.dart';
import 'package:ruta_limpia/app/routes/routes.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,42, 202, 170),
      //appBar: AppBar(
        //title: const Text('textos')
        //),
        body: Center(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [      
    
            const Padding(
              padding: EdgeInsets.all(60.0),
              child: Text(
                textAlign: TextAlign.center,
                "¿Preocupado por perder la recolección de basura? \n Con Ruta Limpia, nunca perderás la vista tu camión de basura",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.5
                  )  
              ),
            ),
            //Image.asset('assets/trashtruck_vistamain.png'),
            Padding(
            padding: const EdgeInsets.only(bottom: 90.0),
            child: Image.asset('assets/trash_truck.png',width: 200)
            ),

            ElevatedButton(
              
              onPressed: () {
                Navigator.pushNamed(context, Routes.PERMISSIONS);
              },
              
              style: ButtonStyle(            
                fixedSize: MaterialStateProperty.all(const Size(250, 60)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(width: 3, color: Colors.black),
                  ),
                ),
                
              ),
              child: const Text('Continuar',style : TextStyle(
                color: Colors.black,
                fontSize: 20
              
              )),
              
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.center,
                "¿Ya tienes una cuenta?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.5
                  )  
              ),
            ),
            TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(        
                fontSize: 20
                ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.LOGIN);
            },
            child: const Text('Iniciar Sesión',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
            ),
            ),


            
          ],
        ),     
        ),    
    );       
  }
}