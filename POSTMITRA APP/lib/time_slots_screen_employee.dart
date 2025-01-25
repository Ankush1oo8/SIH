import 'package:flutter/material.dart';
import 'order_details_screen.dart'; // Import the OrderDetailsScreen

class TimeSlotsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> timeSlots = [
    {'time': '10:00 am-11:00 am', 'orders': ['MM09132005']},
    {'time': '11:00 am-12:00 pm', 'orders': ['FU84593276', 'MA84561259']},
    {'time': '12:00 pm-1:00 pm', 'orders': ['MM5678945']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today\'s Time Slot',
          style: TextStyle(color: Colors.red.shade400),
        ),
        backgroundColor: Colors.orange.shade50,
        iconTheme: IconThemeData(color: Colors.red.shade400),
        elevation: 0,
      ),
      body: Container(
        color: Colors.orange.shade50,
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            final timeSlot = timeSlots[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeSlot['time'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade400,
                  ),
                ),
                SizedBox(height: 10),
                ...timeSlot['orders'].map<Widget>((orderId) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailsScreen(
                            orderId: orderId,
                            customerName: 'John Doe', // Placeholder name
                            timeSlot: timeSlot['time'],
                            documentType: 'Delivery Receipt', // Placeholder document type
                            address: '123 Street, City, Country', // Placeholder address
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          'Order Id-$orderId',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
