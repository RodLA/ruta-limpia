import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ruta_limpia/app/const/colors.dart';
import 'package:ruta_limpia/app/screens/users/citizen/citizen_map_controller.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';

class CitizenMapScreen extends StatelessWidget {
  const CitizenMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //? Escuchara un ChangeNotifier de <citizenMapController>
    //? ChangeNotifier para recontruir los dependientes(MARKERS)
    return ChangeNotifierProvider<CitizenMapController>(
      create: (_) {
        final controller = CitizenMapController();

        //*ecucha el emit (stream) del controlador
        controller.onMarkerTap.listen((id) {
          // ignore: avoid_print
          print("go to : $id");
        });
        return controller;
      },
      child: Scaffold(

          //* APP BAR
          appBar: AppBar(
            backgroundColor: ColorsMyApp.secondarycolor,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 36.0,
              ),
              tooltip: 'Navigation menu',
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                // const SnackBar(content: Text('Volver')));
                Navigator.pushReplacementNamed(context, Routes.PERMISSIONS);
              },
            ),
            title: const Text('Ruta Limpia'),
          ),

          //* GOOGLE MAPS
          //*Consumer<T>(...) se utiliza en Flutter como un widget especial que escucha y reconstruye su contenido cada vez que cambia el valor de un objeto de tipo T que se pasa como argumento.
          body: Selector<CitizenMapController, bool>(
            selector: (_, controller) => controller.loading,
            builder: (context, loading, loadingWidget) {
              if (loading) {
                return loadingWidget!;
              }
              return Consumer<CitizenMapController>(
                builder: (_, controller, gpsMessageWidget) {
                  if (!controller.gpsEnabled) {
                    return gpsMessageWidget!;
                  }

                  return GoogleMap(
                    markers: controller.markers,
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: controller.initialCameraPosition,
                    onTap: controller.onTap,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Debe habilitar el GPS"),
                      ElevatedButton(
                          onPressed: () {
                            final  controller = context.read<CitizenMapController>();
                            controller.turnOnGPS();
                          }, child: const Text("turn on gps"))
                    ],
                  ),
                ),
              );
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
