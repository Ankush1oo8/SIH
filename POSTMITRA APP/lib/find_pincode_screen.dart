import 'package:flutter/material.dart';

class FindPincodeScreen extends StatefulWidget {
  @override
  _FindPincodeScreenState createState() => _FindPincodeScreenState();
}

class _FindPincodeScreenState extends State<FindPincodeScreen> {
  String? selectedState;
  String? selectedCity;

  final Map<String, List<String>> stateCityMap = {
    'Maharashtra': ['Pune', 'Mumbai', 'Nagpur'],
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli'],
    'Delhi': ['New Delhi', 'Central Delhi', 'East Delhi'],
  };

  final Map<String, String> pincodeMap = {
    'Pune': '411001',
    'Mumbai': '400001',
    'Nagpur': '440001',
    'Bangalore': '560001',
    'Mysore': '570001',
    'Hubli': '580001',
    'New Delhi': '110001',
    'Central Delhi': '110002',
    'East Delhi': '110003',
  };

  String? pincode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Pincode',
          style: TextStyle(color: Colors.red.shade400),
        ),
        backgroundColor: Colors.orange.shade50,
        iconTheme: IconThemeData(color: Colors.red.shade400),
        elevation: 0,
      ),
      body: Container(
        color: Colors.orange.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select State:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedState,
              isExpanded: true,
              hint: Text('Choose a state'),
              items: stateCityMap.keys.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedState = value;
                  selectedCity = null;
                  pincode = null; // Reset pincode
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Select City:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedCity,
              isExpanded: true,
              hint: Text('Choose a city'),
              items: selectedState == null
                  ? []
                  : stateCityMap[selectedState]!.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                  pincode = pincodeMap[value]; // Fetch pincode
                });
              },
            ),
            SizedBox(height: 30),
            if (pincode != null)
              Center(
                child: Text(
                  'Pincode: $pincode',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade400,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
