import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
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
      ),
      body: ListView(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 50.0,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: name,
            decoration: InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          SizedBox(height: 10.0),
          TextFormField(
            initialValue: lastName,
            decoration: InputDecoration(
              labelText: 'Apellido',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                lastName = value;
              });
            },
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            initialValue: email,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          const SizedBox(height: 20.0),
          
        ],
      ),
    );
  }
}
