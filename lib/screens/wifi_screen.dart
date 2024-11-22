import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WiFiConnectionScreen extends StatefulWidget {
  @override
  _WiFiConnectionScreenState createState() => _WiFiConnectionScreenState();
}

class _WiFiConnectionScreenState extends State<WiFiConnectionScreen> {
  List<WiFiNetwork> _wifiNetworks = [];
  bool _isConnected = false;
  String _connectedSSID = '';

  @override
  void initState() {
    super.initState();
    _checkWiFiStatus();
  }

  // Check if Wi-Fi is enabled and available
  Future<void> _checkWiFiStatus() async {
    bool isEnabled = await WiFiForIoTPlugin.isEnabled();
    if (!isEnabled) {
      // Enable Wi-Fi if it's not enabled
      await WiFiForIoTPlugin.setEnabled(true);
    }
    _scanForNetworks();
  }

  // Scan for available Wi-Fi networks
  Future<void> _scanForNetworks() async {
    List<WiFiNetwork> networks = await WiFiForIoTPlugin.loadWifiList();
    setState(() {
      _wifiNetworks = networks;
    });
  }

  // Connect to a selected Wi-Fi network
  Future<void> _connectToWiFi(String ssid, String password) async {
    bool success = await WiFiForIoTPlugin.connect(ssid, password: password, security: NetworkSecurity.WPA);
    if (success) {
      setState(() {
        _isConnected = true;
        _connectedSSID = ssid;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to connect to $ssid'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WiFi IoT Example"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display connected Wi-Fi status
            Text(_isConnected
                ? 'Connected to: $_connectedSSID'
                : 'Not connected to any Wi-Fi'),
            SizedBox(height: 20),
            // List available Wi-Fi networks
            Expanded(
              child: ListView.builder(
                itemCount: _wifiNetworks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_wifiNetworks[index].ssid),
                    subtitle: Text(_wifiNetworks[index].bssid),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Connect to the selected Wi-Fi network
                        _connectToWiFi(
                          _wifiNetworks[index].ssid,
                          'your_password', // Replace with the correct password
                        );
                      },
                      child: Text('Connect'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}