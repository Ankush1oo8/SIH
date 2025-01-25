import 'package:flutter/material.dart';
import 'send_to_screen.dart';

class SendParcelScreen extends StatefulWidget {
  @override
  _SendParcelScreenState createState() => _SendParcelScreenState();
}

class _SendParcelScreenState extends State<SendParcelScreen> {
  String? selectedState;
  String? selectedCity;
  final TextEditingController pincodeController = TextEditingController();

  final Map<String, List<String>> stateCityMap = {
    'Maharashtra': ['Pune', 'Mumbai', 'Nagpur'],
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli'],
    'Delhi': ['New Delhi', 'Central Delhi', 'East Delhi'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send Parcel',
          style: TextStyle(color: Colors.red.shade400),
        ),
        backgroundColor: Colors.orange.shade50,  // Keep consistent with previous pages
        iconTheme: IconThemeData(color: Colors.red.shade400),
        elevation: 0,
      ),
      body: Container(
        color: Colors.orange.shade50, // Consistent background color
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading
                    Text(
                      'Send From',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade400,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Select State Dropdown
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
                          selectedCity = null;  // Reset city when state is changed
                        });
                      },
                    ),
                    SizedBox(height: 20),

                    // Select City Dropdown
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
                        });
                      },
                    ),
                    SizedBox(height: 20),

                    // Pincode Input Field
                    Text(
                      'Enter Pincode:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: pincodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter pincode',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Next Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validation: Ensure all fields are filled
                  if (selectedState != null &&
                      selectedCity != null &&
                      pincodeController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendToScreen(
                          fromState: selectedState!,
                          fromCity: selectedCity!,
                          fromPincode: pincodeController.text,
                        ),
                      ),
                    );
                  } else {
                    // Show Snackbar if any field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill all the fields'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
