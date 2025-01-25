import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String timeSlot;
  final String documentType;
  final String address;

  const OrderDetailsScreen({
    Key? key,
    required this.orderId,
    required this.customerName,
    required this.timeSlot,
    required this.documentType,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Information',
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
            SizedBox(height: 20),
            Center(
              child: Text(
                'Order ID: $orderId',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Customer Name: $customerName',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Time Slot: $timeSlot',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Document Type: $documentType',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Address: $address',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Column(
              children: [
                // Delivery Completed Button
                SizedBox(
                  width: double.infinity, // Full width
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Delivery Completed!')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400, // AppBar text color
                      fixedSize: Size(double.infinity, 50), // Full width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Delivery Completed',
                      style: TextStyle(fontSize: 14, color: Colors.black), // Text color black
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between the buttons
                // Delivery Rejected Button
                SizedBox(
                  width: double.infinity, // Full width
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Delivery Rejected!')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400, // AppBar text color
                      fixedSize: Size(double.infinity, 50), // Full width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Delivery Rejected',
                      style: TextStyle(fontSize: 14, color: Colors.black), // Text color black
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
