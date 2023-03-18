import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  final List<DateTime> dates = [
    DateTime.now().add(Duration(days: 0)),
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
    DateTime.now().add(Duration(days: 3)),
    DateTime.now().add(Duration(days: 4)),
  ];

  final List<List<String>> hours = [
    ['08:00', '09:00'],
    ['10:00', '11:00', '12:00'],
    ['13:00', '14:00', '15:00'],
    ['16:00', '17:00', '18:00'],
    ['19:00', '20:00'],
  ];

  ///RUTAS
  final List<String> routes = ['Ruta 1', 'Ruta 2', 'Ruta 3', 'Ruta 4', 'Ruta 5'];

  final List<List<String>> directions = [    ['Dirección 1', 'Dirección 2'],
    ['Dirección 3', 'Dirección 4', 'Dirección 5'],
    ['Dirección 6', 'Dirección 7', 'Dirección 8'],
    ['Dirección 9', 'Dirección 10', 'Dirección 11'],
    ['Dirección 12', 'Dirección 13'],
  ];
  ///RUTASS
    final List<String> rutas = ['Ruta 1', 'Ruta 2', 'Ruta 3', 'Ruta 4', 'Ruta 5'];

  final List<String> direcciones = [
    'Calle 1',
    'Calle 2',
    'Calle 3',
    'Calle 4',
    'Calle 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
       body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //flex: 1,
                  child: ListView.builder(
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //width: MediaQuery.of(context).size.width * 0.1, // ancho del 20% de la pantalla
                        margin: EdgeInsets.symmetric(vertical: 4.0,horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: ListTile(
                          title: Text('${dates[index].day}'),
                          subtitle: Text('${_getMonth(dates[index])}'),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: hours.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 30.0),
                        color: Colors.grey[100],
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 30.0),
                          title: Text('${hours[index].join(' - ')}'),
                          subtitle: Text('Descripción del evento'),
                        ),
                      );
                    },
                  ),
                ),
                
              ],
            ),
            
          ),
          /////
          /// RUTAS ME MAREO :C
          ///
          Text('Rutas de "Comunidad"'),
          SizedBox(height: 20,),
          Expanded(
            child: Row(
              children: [
                Expanded(
            //flex: 1,
            child: ListView.builder(
              itemCount: rutas.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0,horizontal: 15.0),
                  height: 50,
                  color: Color.fromARGB(255, 184, 187, 192),
                  child: Center(
                    child: Text(
                      rutas[index],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
                Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: direcciones.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0,horizontal: 15.0),
                      height: 50,
                      color: Color.fromARGB(255, 100, 97, 97),
                      child: Center(
                        child: Text(
                          direcciones[index],
                          style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
                
              ],
            ),
            
          ),
        ],
      ),
    );
      
  }

  String _getMonth(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return 'Ene';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Ago';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dic';
      default:
        return '';
    }
  }
}
