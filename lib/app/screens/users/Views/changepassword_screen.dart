import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _hideCurrentPassword = true;
  bool _hideNewPassword = true;
  bool _hideConfirmPassword = true;

  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Contraseña'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // accion al presionar el botón del menú
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100.0),
                //const Text('Contraseña Acual'),
                const SizedBox(height: 8.0),
                const SizedBox(
                  width: 320.0,
                  height: 25.0,
                  child: Text('Contraseña Actual'),
                ),
                SizedBox(
                  width: 320.0,
                  height: 40.0,
                  child: TextField(
                    controller: _currentPasswordController,
                    obscureText: _hideCurrentPassword,
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu contraseña actual',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 175, 172, 171)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hideCurrentPassword = !_hideCurrentPassword;
                          });
                        },
                        icon: Icon(
                          _hideCurrentPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const SizedBox(
                  width: 320.0,
                  height: 25.0,
                  child: Text('Nueva Contraseña'),
                ),
                //const SizedBox(height: 8.0),
                SizedBox(
                  width: 320.0,
                  height: 40.0,
                  child: TextField(
                    controller: _newPasswordController,
                    obscureText: _hideNewPassword,
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu nueva contraseña',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 175, 172, 171)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hideNewPassword = !_hideNewPassword;
                          });
                        },
                        icon: Icon(
                          _hideNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                //const Text('Confirmar Nueva Contraseña'),
                const SizedBox(
                  width: 320.0,
                  height: 25.0,
                  child: Text('Confirmar Nueva Contraseña'),
                ),
                //const SizedBox(height: 8.0),
                SizedBox(
                  width: 320.0,
                  height: 40.0,
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: _hideConfirmPassword,
                    decoration: InputDecoration(
                      hintText: 'Confirma tu nueva contraseña',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 175, 172, 171)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hideConfirmPassword = !_hideConfirmPassword;
                          });
                        },
                        icon: Icon(
                          _hideConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 55.0),
                Center(
                  child: SizedBox(
                    width: 250.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // ...
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Guardar cambios',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 42, 202, 170),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
