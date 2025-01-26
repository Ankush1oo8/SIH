import 'package:flutter/material.dart';
import 'available_time_slot_screen.dart';
import 'update_delivery_date_screen.dart';
import 'update_address_screen.dart'; // Import the new Update Address screen

class UpcomingDeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50, // Updated to match previous page's background
      appBar: AppBar(
        backgroundColor: Colors.red.shade300, // Updated to match previous page's AppBar color
        title: Text('Upcoming Delivery'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AvailableTimeSlotScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shadowColor: Colors.grey.shade500,
                  elevation: 5,
                  side: BorderSide(color: Colors.redAccent), // Added border to match previous theme
                ),
                child: Text(
                  'Update delivery time slot',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDeliveryDateScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shadowColor: Colors.grey.shade500,
                  elevation: 5,
                  side: BorderSide(color: Colors.redAccent), // Added border to match previous theme
                ),
                child: Text(
                  'Update delivery date',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateAddressScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shadowColor: Colors.grey.shade500,
                  elevation: 5,
                  side: BorderSide(color: Colors.redAccent), // Added border to match previous theme
                ),
                child: Text(
                  'Update address',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
