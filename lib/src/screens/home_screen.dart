import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappy/src/screens/map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";
  double lat=0;
  double long=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mappy'),
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              _createName(),
              Divider(),
              _createLat(),
              Divider(),
              _createLong(),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MapScreen(data:{'name':name, 'lat':lat, 'long':long}),
                ),);

              }, child: Text('Buscar')),
        ],
      )),
    );
  }
  _createName() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          hintText: "Nombre del marcador",
          labelText: "Nombre",
          icon: Icon(Icons.map)
      ),
      onChanged: (valor){
        setState(() {
          name = valor;
        });
      },
    );
  }

  _createLong() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,


      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          labelText: "Longitud",
          icon: Icon(Icons.navigation)
      ),
      onChanged: (valor){
        setState(() {
          long = double.parse(valor);
        });
      },
    );
  }

  _createLat() {
   return  TextField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          labelText: "Latitud",
          icon: Icon(Icons.navigation)
      ),
      onChanged: (valor){
        setState(() {
          lat = double.parse(valor);
        });
      },
    );
  }
}
