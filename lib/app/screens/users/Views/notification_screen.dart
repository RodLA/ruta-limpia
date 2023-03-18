import 'package:flutter/material.dart';

class NuevaPantalla extends StatefulWidget {
  
  @override
  _NuevaPantallaState createState() => _NuevaPantallaState();
}


class _NuevaPantallaState extends State<NuevaPantalla> {


int _selectedValue = 0;
double _alarmVolume = 0.5;
String _selectedAlarmTone = 'Tono de alarma 1';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Pantalla'),
      ),
  body: Column(
  //crossAxisAlignment: CrossAxisAlignment.center,
  
  children: [
    const Text('Frecuencia de Notificaciones:',
    style: TextStyle(
      fontWeight: FontWeight.bold
    ),),
    SizedBox(height: 20.0,),
    Flexible(
      
      child: Container(
        height: 180,
        width: 250,
        margin: EdgeInsets.only(left: 40),
        decoration: BoxDecoration(
          
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
          
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Avisar:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: const Text('Cuando esté cerca'),
                    value: 0,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.all(0),
                    activeColor: const Color.fromARGB(255, 42, 202, 170),

                   
                  ),
                  RadioListTile(
                    title: Text('Un día antes'),
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.all(0),
                    activeColor: const Color.fromARGB(255, 42, 202, 170),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ///////////////////
            //////////////
            Center(child: SizedBox(
              child:  Container(
                alignment: Alignment.center,
                height: 300,
                width: 350,
              //margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tono de alarma:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    value: _selectedAlarmTone,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedAlarmTone = newValue;
                      });
                    },
                    items: <String>['Tono de alarma 1', 'Tono de alarma 2', 'Tono de alarma 3', 'Tono de alarma 4']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  ),

                  const SizedBox(height: 16.0),
                  const Text(
                    'Volumen de alarma:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Slider(
                    value: _alarmVolume,
                    onChanged: (double newValue) {
                      setState(() {
                        _alarmVolume = newValue;
                      });
                    },
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                    label: _alarmVolume.toStringAsFixed(1),
                    ),
                  ],
              ),
              ),
            ),)
            
],
),

  );
  }
}
