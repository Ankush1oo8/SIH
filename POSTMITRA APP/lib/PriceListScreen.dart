import 'package:flutter/material.dart';
import 'package:login_screen/thank_you_screen..dart';
class PriceListScreen extends StatelessWidget {
  final String extraCharges;

  PriceListScreen({required this.extraCharges});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text('Price list for parcel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Extra charges are $extraCharges',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPriceItem('Emergency charges', '80'),
                  _buildPriceItem('Storage charges for 2 or more days', '100'),
                  _buildPriceItem('Customization charges', '50'),
                  _buildPriceItem('Extra charges', '20'),
                  _buildPriceItem('Holiday delivery charges', '70'),
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Thank You page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThankYouScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shadowColor: Colors.grey.shade500,
                elevation: 5,
                side: BorderSide(color: Colors.redAccent),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceItem(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Wrap the title with a Flexible widget to avoid overflow
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis, // This prevents overflow by truncating text
            ),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
