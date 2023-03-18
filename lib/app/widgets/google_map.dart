import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../screens/users/citizen/citizen_map_controller.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CitizenMapController>(
      builder: (_, controller, gpsMessageWidget) {
        if (!controller.gpsEnabled) {
          return gpsMessageWidget!;
        }

        final initialCameraPosition = CameraPosition(
            target: LatLng(controller.initialPosition!.latitude,
                controller.initialPosition!.longitude),
            zoom: 18);

        return GoogleMap(
          markers: controller.markers,
          polylines: controller.polylines,
          polygons: controller.polygons,
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: initialCameraPosition,
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
                  final controller = context.read<CitizenMapController>();
                  controller.turnOnGPS();
                },
                child: const Text("turn on gps"))
          ],
        ),
      ),
    );
  }
}
