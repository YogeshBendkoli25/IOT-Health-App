import 'package:flutter/material.dart';
import 'package:iot_health_app/screens/data_visual_screen.dart';
import 'package:iot_health_app/screens/device_list_screen.dart';
import 'package:iot_health_app/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/devices': (context) => DeviceListScreen(),
        '/data': (context) => DataVisualizationScreen(),
      },
    );
  }
}
