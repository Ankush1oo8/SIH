import 'package:flutter/material.dart';
import 'payment_screen.dart';

class PickupAddressScreen extends StatefulWidget {
  final String toState;
  final String toCity;
  final String toPincode;
  final String itemType;
  final String weight;
  final String length;

  const PickupAddressScreen({
    Key? key,
    required this.toState,
    required this.toCity,
    required this.toPincode,
    required this.itemType,
    required this.weight,
    required this.length,
  }) : super(key: key);

  @override
  _PickupAddressScreenState createState() => _PickupAddressScreenState();
}

class _PickupAddressScreenState extends State<PickupAddressScreen> {
  final TextEditingController pickupNameController = TextEditingController();
  final TextEditingController pickupAddressController = TextEditingController();
  final TextEditingController pickupPincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50, // Background color
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50, // AppBar color
        title: Text(
          'Pickup Address',
          style: TextStyle(
            color: Colors.red.shade400, // Title color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.red.shade400), // Icon color
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pickup Address',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade400, // Heading color
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: pickupNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black), // Label color
                filled: true,
                fillColor: Colors.white, // Background color of the text box
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pickupAddressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.black), // Label color
                filled: true,
                fillColor: Colors.white, // Background color of the text box
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pickupPincodeController,
              decoration: InputDecoration(
                labelText: 'Pincode',
                labelStyle: TextStyle(color: Colors.black), // Label color
                filled: true,
                fillColor: Colors.white, // Background color of the text box
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (pickupNameController.text.isNotEmpty &&
                      pickupAddressController.text.isNotEmpty &&
                      pickupPincodeController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          toState: widget.toState,
                          toCity: widget.toCity,
                          toPincode: widget.toPincode,
                          itemType: widget.itemType,
                          weight: widget.weight,
                          length: widget.length,
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
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: Text(
                  'Confirm Pickup',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
