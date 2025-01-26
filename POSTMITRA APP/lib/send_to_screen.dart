import 'package:flutter/material.dart';
import 'package:login_screen/pick_up_Address.dart';
import 'payment_screen.dart';

class SendToScreen extends StatefulWidget {
  final String fromState;
  final String fromCity;
  final String fromPincode;

  SendToScreen({
    required this.fromState,
    required this.fromCity,
    required this.fromPincode,
  });

  @override
  _SendToScreenState createState() => _SendToScreenState();
}

class _SendToScreenState extends State<SendToScreen> {
  String? toState;
  String? toCity;
  String? itemType;
  final TextEditingController toPincodeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();

  final Map<String, List<String>> stateCityMap = {
    'Maharashtra': ['Pune', 'Mumbai', 'Nagpur'],
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli'],
    'Delhi': ['New Delhi', 'Central Delhi', 'East Delhi'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50, // Set background color
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50, // Set AppBar color
        title: Text(
          'Send To',
          style: TextStyle(
            color: Colors.red.shade400, // Title text color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.orange.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send To',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Heading color
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select State:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Label color
                      ),
                    ),
                    DropdownButton<String>(
                      value: toState,
                      isExpanded: true,
                      hint: Text('Choose a state'),
                      items: stateCityMap.keys.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(
                            state,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          toState = value;
                          toCity = null; // Reset city when state is changed
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select City:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Label color
                      ),
                    ),
                    DropdownButton<String>(
                      value: toCity,
                      isExpanded: true,
                      hint: Text('Choose a city'),
                      items: toState == null
                          ? []
                          : stateCityMap[toState]!.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(
                            city,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          toCity = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Enter Pincode:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Label color
                      ),
                    ),
                    TextField(
                      controller: toPincodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter pincode',
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white, // Background color
                      ),
                      style: TextStyle(color: Colors.black), // Text color
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Article Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade400, // Heading color
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select Item Type:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Label color
                      ),
                    ),
                    DropdownButton<String>(
                      value: itemType,
                      isExpanded: true,
                      hint: Text('Choose item type'),
                      items: ['Document', 'Parcel'].map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          itemType = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Weight (in grams):',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Label color
                      ),
                    ),
                    TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter weight',
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white, // Background color
                      ),
                      style: TextStyle(color: Colors.black), // Text color
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Length (in cm):',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Label color
                      ),
                    ),
                    TextField(
                      controller: lengthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter length',
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white, // Background color
                      ),
                      style: TextStyle(color: Colors.black), // Text color
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (toState != null &&
                      toCity != null &&
                      toPincodeController.text.isNotEmpty &&
                      itemType != null &&
                      weightController.text.isNotEmpty &&
                      lengthController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickupAddressScreen(
                          toState: toState!,
                          toCity: toCity!,
                          toPincode: toPincodeController.text,
                          itemType: itemType!,
                          weight: weightController.text,
                          length: lengthController.text,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all the fields')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded button edges
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10), // Smaller button
                ),
                child: Text(
                  'Confirm Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Smaller font size
                    fontWeight: FontWeight.bold, // Bold text on the button
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
