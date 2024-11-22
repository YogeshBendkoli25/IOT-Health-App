import 'dart:async';

import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class ConnectionService {
  Future<void> connectToDevice(String deviceName, String connectionType) async {
    await Future.delayed(Duration(seconds: 2));
    print('Connected to $deviceName via $connectionType');
  }

  Stream<int> fetchData() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      yield 50 + DateTime.now().second % 10;
    }
  }
}

Future<void> getWiFiDetails() async {
  var wifiInfo = await WifiInfo().getWifiName();
  print("Connected to Wi-Fi: ${wifiInfo}");
}
