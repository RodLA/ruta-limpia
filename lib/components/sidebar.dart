import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color.fromARGB(255, 42, 202, 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const InfoCard(
                    name: "Invitado",
                    profession: "Editar Perfil",
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          SideMenuTile(
                            title: 'Inicio',
                            icon: CupertinoIcons.home,
                            onTap: () {
                              Navigator.pushNamed(context, "/register");
                            },
                          ),
                          SideMenuTile(
                            title: 'Información',
                            icon: CupertinoIcons.info,
                            onTap: () {
                              Navigator.pushNamed(context, '/firstscreen');
                            },
                          ),
                          SideMenuTile(
                            title: 'Notificaciones',
                            icon: CupertinoIcons.bell,
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                          ),
                          SideMenuTile(
                            title: 'Puntos Críticos',
                            icon: CupertinoIcons.map_pin_ellipse,
                            onTap: () {
                              Navigator.pushNamed(context, '/firstscreen');
                            },
                          ),
                          SideMenuTile(
                            title: 'Sugerencias',
                            icon: CupertinoIcons.heart,
                            onTap: () {
                              Navigator.pushNamed(context, '/firstscreen');
                            },
                          ),
                          Expanded(
                              child: Center(
                                  child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Image.asset(
                              'assets/camion.png',
                              width: 60,
                              height: 60,
                            ),
                          )))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 30, left: 25),
      leading: SizedBox(
        height: 34,
        width: 34,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.profession,
  }) : super(key: key);

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white30,
          child: Icon(CupertinoIcons.person, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          profession,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
