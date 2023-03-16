import 'package:flutter/widgets.dart';
import 'package:ruta_limpia/app/routes/routes.dart';
import 'package:ruta_limpia/app/screens/splash/splash_page.dart';
import 'package:ruta_limpia/app/screens/users/Views/login_screen.dart';
import 'package:ruta_limpia/app/screens/users/Views/register_screen.dart';
import 'package:ruta_limpia/app/screens/users/citizen/citizen_map_screen.dart';
import 'package:ruta_limpia/app/screens/users/home/home.dart';
import 'package:ruta_limpia/app/screens/users/home/home_screen.dart';
import 'package:ruta_limpia/app/screens/users/request_permission/request_permission_screen.dart';

//es una función que devuelve un mapa de rutas que se utilizará para la navegación en la aplicación
Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPLASH:(_) =>  SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionScreen(),
    Routes.FIRST: (_) => const HomePage(),
    Routes.MAP_SELECT_HOUSE: (_) => const CitizenMapScreen(),
    Routes.LOGIN: (_) => const loginsreen(),
    Routes.REGISTER:(_) =>  const registerscreen(),
    Routes.HOME: (_) => const HomeScreen(),
  };
}