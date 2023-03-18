import 'package:flutter/material.dart';
import 'package:ruta_limpia/app/screens/users/trace_route/track_simulation_citizen_screen.dart';

import '../../../const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ruta Limpia'),
        backgroundColor: ColorsMyApp.primarycolor,
        
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Image.asset(
        //       'assets/trash_truck.png',
        //       fit: BoxFit.contain,
        //       height: 50.0,
        //     ),
        //   ],
        // ),

      ),
      body: const TrackSimulationCitizenScreen(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsMyApp.primarycolor,
              ),
              child: Text('Bienvenido a Ruta Limpia'),
            ),
            ListTile(
              title: const Text('Notificaciones'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Notificaciones'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
