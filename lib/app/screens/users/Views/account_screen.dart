import 'package:flutter/material.dart';
import 'package:ruta_limpia/app/routes/routes.dart';

class UserProfileScreen extends StatefulWidget {
     const UserProfileScreen({super.key});
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String name = '';
  String lastName = '';
  String email = '';
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi cuenta'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // accion al presionar el botón del menú
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          CircleAvatar(
            // backgroundImage: AssetImage('assets/user-account.png'),
            radius: 50, // ajusta el tamaño del avatar
            child: Icon(Icons.person, size: 86),
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.only(
                bottom: 20.0,
                left: 30.0,
                right:
                    30.0), //PADDING PARA QUE NO SEAN TAN ANCHAS LAS TEXTFORMFIELD
            height: 90, //ALTURA DE TEXTFORMFIELD
            child: TextFormField(
              initialValue: name,
              decoration: InputDecoration(
                labelText: 'Nombres',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0)),
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.only(
                bottom: 20.0,
                left: 30.0,
                right:
                    30.0), //PADDING PARA QUE NO SEAN TAN ANCHAS LAS TEXTFORMFIELD
            height: 90, //ALTURA DE TEXTFORMFIELD
            child: TextFormField(
              initialValue: lastName,
              decoration: InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0)),
              ),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.only(
                bottom: 20.0,
                left: 30.0,
                right:
                    30.0), //PADDING PARA QUE NO SEAN TAN ANCHAS LAS TEXTFORMFIELD
            height: 90, //ALTURA DE TEXTFORMFIELD
            child: TextFormField(
              initialValue: email,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0)),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20.0),

          ///BOTONES
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: ElevatedButton(
              onPressed: () {
                // accion al presionar el boton "Guardar cambios"
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60.0), //ALTURA
                backgroundColor: const Color.fromARGB(
                    255, 42, 202, 170), // establece el color verde
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // establece un radio de 10 en los cuatro lados
                ),
              ),
              child: const Text('Guardar cambios',style: TextStyle(color: Colors.white),),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: ElevatedButton(
              onPressed: () {
                // accion al presionar el boton "Cambiar contraseña"
                Navigator.pushNamed(context,Routes.CHANGEPASSWORD);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60.0), //ALTURA
                backgroundColor:
                    Colors.grey[400], // establece un color gris claro
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // establece un radio de 10 en los cuatro lados
                ),
              ),
              child: const Text('Cambiar contraseña',style: TextStyle(color: Colors.white),),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
