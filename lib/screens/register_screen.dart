import 'package:flutter/material.dart';

class registerscreen extends StatefulWidget {
  const registerscreen({super.key});

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255,42, 202, 170)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 49,),
              Image.asset('assets/logo.png'),
              const SizedBox(height: 15,),

              const SizedBox(height: 30,),
              Container(
                height: 500,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),
                      const Text('Registro',
                        style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      const SizedBox(height: 10,),
                    
                      const SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Nombres y Apellidos',
                            
                          ),
                        ),
                      ),
                       Container(
                        width: 250,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Correo',
                            
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            
                          ),
                        ),
                      ),
                       Container(
                        width: 250,
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirmar Contraseña', 
                          ),
                        ),
                      ),
                    
                      const SizedBox(height: 20,),
                      ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/sidebar");
                      },     
                      style: ButtonStyle(            
                        fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 42, 202, 170)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            
                          ),
                        ),
                        
                      ),
                      child: const Text('Registrarse',style : 
                        TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        
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