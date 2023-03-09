import 'package:flutter/material.dart';
import '../Services/LocaationService.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _locationMessage = "";
  void _getCurrentLocation() async {
    LocationService ls = LocationService();
    await ls.getCurrentLocation();

    setState(() {
      _locationMessage = "${ls.latitude}, ${ls.longitude}";
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(title: Text("Location Services")),
            body: Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_locationMessage),
                    ElevatedButton(
                        onPressed: () {
                          _getCurrentLocation();
                        },
                        child: Text("Find Location"))
                  ]),
            )));
  }
}
