import 'package:flutter/material.dart';
import 'package:ruta_limpia/app/routes/pages.dart';
import 'package:ruta_limpia/app/routes/routes.dart';

import 'app/const/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: ColorsMyApp.secondarycolor,
              onPrimary: ColorsMyApp.optionalcolor,
              secondary: ColorsMyApp.primarycolor,
              onSecondary: ColorsMyApp.tertiarycolor,
              error: ColorsMyApp.errorcolor,
              onError: ColorsMyApp.onErrorcolor,
              background: ColorsMyApp.backgroundcolor,
              onBackground: ColorsMyApp.onbackgroundcolor,
              surface: ColorsMyApp.surfacecolor,
              onSurface: ColorsMyApp.onsurfacecolor),
        ),
      initialRoute: Routes.NOTIFICATION,
      routes: appRoutes(),
    );
  }
}
