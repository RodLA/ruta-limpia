import 'package:flutter/widgets.dart';
import 'package:ruta_limpia/app/routes/routes.dart';
import 'package:ruta_limpia/app/screens/splash/splash_page.dart';
import 'package:ruta_limpia/app/screens/users/Views/account_screen.dart';
import 'package:ruta_limpia/app/screens/users/Views/changepassword_screen.dart';
import 'package:ruta_limpia/app/screens/users/Views/diary_screen.dart';

import 'package:ruta_limpia/app/screens/users/Views/login_screen.dart';
import 'package:ruta_limpia/app/screens/users/Views/notification_screen.dart';
import 'package:ruta_limpia/app/screens/users/Views/register_screen.dart';

import 'package:ruta_limpia/app/screens/users/citizen/citizen_map_screen.dart';
import 'package:ruta_limpia/app/screens/users/home/first.dart';

import 'package:ruta_limpia/app/screens/users/home/home_screen.dart';
import 'package:ruta_limpia/app/screens/users/request_permission/request_permission_screen.dart';
import 'package:ruta_limpia/app/screens/users/home/charge_screen.dart';


//es una función que devuelve un mapa de rutas que se utilizará para la navegación en la aplicación
Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPLASH:(_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionScreen(),
    Routes.FIRST: (_) => const HomePage(),
    Routes.MAP_SELECT_HOUSE: (_) => const CitizenMapScreen(),
    Routes.LOGIN: (_) => const LoginScreen(),
    Routes.REGISTER:(_) =>  const RegisterScreen(),
    Routes.HOME: (_) => const HomeScreen(),
    Routes.CHARGE:(_) => const SplashScreen(),
    Routes.ACCOUNT: (_) => const UserProfileScreen(),
    Routes.CHANGEPASSWORD: (_) => ChangePasswordScreen(),
    Routes.DIARYROUTES: (_) => AgendaScreen(),
    Routes.NOTIFICATION: (_) => NuevaPantalla(),
  };
}