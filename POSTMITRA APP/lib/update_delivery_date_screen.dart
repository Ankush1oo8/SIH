import 'package:flutter/material.dart';

import 'PriceListScreen.dart';

class UpdateDeliveryDateScreen extends StatefulWidget {
  @override
  _UpdateDeliveryDateScreenState createState() =>
      _UpdateDeliveryDateScreenState();
}

class _UpdateDeliveryDateScreenState extends State<UpdateDeliveryDateScreen> {
  DateTime? _initialDeliveryDate = DateTime(2024, 8, 22); // Pre-filled initial date
  DateTime? _updatedDeliveryDate; // Variable to store the selected updated date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text('Update Delivery Date'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Initial delivery date section
            Text(
              'Initial delivery date',
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
            SizedBox(height: 8),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: '${_initialDeliveryDate!.day} ${_getMonthName(_initialDeliveryDate!.month)} ${_initialDeliveryDate!.year}',
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Updated delivery date section
            Text(
              'Updated delivery date',
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
            SizedBox(height: 8),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: _updatedDeliveryDate != null
                    ? '${_updatedDeliveryDate!.day} ${_getMonthName(_updatedDeliveryDate!.month)} ${_updatedDeliveryDate!.year}'
                    : 'Select a new date',
                hintStyle: TextStyle(fontSize: 18),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _initialDeliveryDate!,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null && pickedDate != _updatedDeliveryDate) {
                  setState(() {
                    _updatedDeliveryDate = pickedDate;
                  });
                }
              },
            ),
            SizedBox(height: 30),

            // Confirm button
            ElevatedButton(
              onPressed: () {
                if (_updatedDeliveryDate != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PriceListScreen(
                        extraCharges: '100', // Pass the extra charges dynamically if needed
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a date first!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shadowColor: Colors.grey.shade500,
                elevation: 5,
                side: BorderSide(color: Colors.redAccent),
              ),
              child: Text(
                'Confirm delivery date',
                style: TextStyle(color: Colors.black),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // Helper method to get month name from month number
  String _getMonthName(int month) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}
