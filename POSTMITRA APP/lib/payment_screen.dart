import 'package:flutter/material.dart';
import 'thank_you_screen_article.dart';

class PaymentScreen extends StatelessWidget {
  final String toState;
  final String toCity;
  final String toPincode;
  final String itemType;
  final String weight;
  final String length;

  PaymentScreen({
    required this.toState,
    required this.toCity,
    required this.toPincode,
    required this.itemType,
    required this.weight,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    // Example cost calculations
    double deliveryCharge = 50.0;
    double weightCharge = double.parse(weight) * 0.2;
    double totalCost = deliveryCharge + weightCharge;

    return Scaffold(
      backgroundColor: Colors.orange.shade50, // Background color similar to LoginScreen
      body: Center(
        child: SingleChildScrollView(  // Make content scrollable
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade400, // Heading color
                  ),
                ),
                SizedBox(height: 10),
                Text('To State: $toState'),
                Text('To City: $toCity'),
                Text('To Pincode: $toPincode'),
                Text('Item Type: $itemType'),
                Text('Weight: $weight gms'),
                Text('Length: $length cm'),
                SizedBox(height: 20),
                Text(
                  'Charges',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade400, // Heading color
                  ),
                ),
                SizedBox(height: 10),
                Text('Delivery Charge: ₹$deliveryCharge'),
                Text('Weight Charge: ₹$weightCharge'),
                Text(
                  'Total Cost: ₹$totalCost',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade400),
                ),
                SizedBox(height: 30),
                Text(
                  'Select Payment Method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade400, // Heading color
                  ),
                ),
                SizedBox(height: 10),
                RadioListTile(
                  title: Text('Credit/Debit Card'),
                  value: 'Card',
                  groupValue: 'payment',
                  onChanged: (value) {},
                ),
                RadioListTile(
                  title: Text('UPI'),
                  value: 'UPI',
                  groupValue: 'payment',
                  onChanged: (value) {},
                ),
                RadioListTile(
                  title: Text('Net Banking'),
                  value: 'Net Banking',
                  groupValue: 'payment',
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThankYouScreen(
                          deliveryDate: DateTime.now().add(Duration(days: 3)),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400, // Button background color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.grey, thickness: 1),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThankYouScreen(
                          deliveryDate: DateTime.now().add(Duration(days: 3)),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Go to Home Page',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
