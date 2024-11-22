import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController deviceNameController = TextEditingController();
  String connectionType = 'Select';  // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IOT Health App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom text input field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: deviceNameController,
                decoration: InputDecoration(
                  labelText: 'Enter Device Name',
                  labelStyle: TextStyle(color: Colors.teal),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30),

            // Stylish dropdown menu
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                value: connectionType,
                isExpanded: true,
                items: <String>['Select', 'Bluetooth', 'Wi-Fi'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.teal),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    // Update the connectionType only if the new value is not null
                    if (newValue != null) {
                      connectionType = newValue;
                    }
                  });
                },
                underline: Container(),
              ),
            ),
            SizedBox(height: 20),

            // Stylish submit button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (connectionType == 'Select') {
                    // Show an error or alert when no selection is made
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please select a connection type'),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    Navigator.pushNamed(context, '/devices', arguments: connectionType);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
