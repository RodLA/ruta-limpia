import 'package:flutter/material.dart';

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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 48, 218, 26),
                Color.fromARGB(255, 13, 126, 38),
                Color.fromARGB(255, 13, 187, 106),
              ]
            ) 
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80,),
              Image.asset('assets/trashtruck.png'),
              const SizedBox(height: 15,),
              const Text('Ruta Limpia',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 600,
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
                      Container(
                        width: 250,
                        child: const TextField(
                          
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            suffixIcon: Icon(Icons.person,
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
                            suffixIcon: Icon(Icons.lock_outline,
                            size: 17,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('¿Olvidó su contraseña?',
                           
                            style: TextStyle(
                              
                              color: Colors.orangeAccent[700]
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/first");
                      },     
                      style: ButtonStyle(            
                        fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 18, 184, 26)),
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
                          Icon(Icons.face,color: Colors.orangeAccent[700],),
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
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text('Registrarse',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
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