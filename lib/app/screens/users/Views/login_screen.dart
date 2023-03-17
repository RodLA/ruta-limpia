import 'package:flutter/material.dart';
import 'package:ruta_limpia/app/routes/routes.dart';

import '../../../const/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                height: 560,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
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
                      const SizedBox(
                        width: 250,
                        child: TextField(
                          
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            suffixIcon: Icon(Icons.person,
                            size: 17,),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 250,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            suffixIcon: Icon(Icons.lock_outline,
                            size: 17,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
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

                        Navigator.pushNamed(context, Routes.SPLASH);
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
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
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