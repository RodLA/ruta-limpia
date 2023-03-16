import 'package:flutter/material.dart';
import 'package:ruta_limpia/app/routes/routes.dart';

import '../../../const/colors.dart';

class loginsreen extends StatefulWidget {
  const loginsreen({super.key});

  @override
  State<loginsreen> createState() => _loginsreenState();
}

class _loginsreenState extends State<loginsreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:ColorsMyApp.primarycolor, 
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              Image.asset('assets/logo.png'),

              Container(
                height: 600,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),
                      const Text('Login',
                        style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      const SizedBox(height: 10,),
                      const Text('Inicia sesión con tu cuenta',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 20,),
                     Container(
                        width: 250,
                        child: const TextField(
                          
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            suffixIcon: Icon(Icons.person,color: ColorsMyApp.primarycolor,
                            size: 17,),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            
                            labelText: 'Contraseña',
                            suffixIcon: Icon(Icons.lock_outline,color: ColorsMyApp.primarycolor,
                            size: 17,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('¿Olvidó su contraseña?',
                           
                            style: TextStyle(
                              
                              color: Colors.black
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/load");
                      },     
                      style: ButtonStyle(            
                        fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all(ColorsMyApp.primarycolor,),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            
                          ),
                        ),
                        
                      ),
                      child: const Text('Ingresar',style : 
                        TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      
                      )),
                      
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //PROXIMAMENTE CON EL FIREBASE PARA CONECTAR CON GOOGLE
                      const Text('Iniciar sesión con su cuenta Google',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.face,color: ColorsMyApp.primarycolor),
                        ],
                      ),
                       const Text('¿No tiene cuenta?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(        
                          fontSize: 16
                          ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.REGISTER);
                      },
                      child: const Text('Registrarse',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsMyApp.primarycolor,
                        decoration: TextDecoration.underline,
                        
                      )
                      ),
                      ),

                      
                    ],
                    ),
              )
            ],
          ),
        )
        ),
    );
  }
}