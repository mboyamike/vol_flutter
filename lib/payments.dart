import 'package:flutter/material.dart';
import 'package:flutter_app/flights.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentsPage extends StatelessWidget {
  final FlightController flightController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay for Ticket"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Text("${flightController.flight.airline}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
            ),
            Text("From: ${flightController.flight.origin}"),
            Text("Departure Date: ${DateFormat.Hm().format(flightController.flight.departureTime)}"),
            SizedBox(height: 8,),
            Text("To: ${flightController.flight.destination}"),
            Text("Arrival Date: ${DateFormat.Hm().format(flightController.flight.arrivalTime)}"),
            Text("Seats: ${flightController.selectedSeats.join(",")}"),
            SizedBox(height: 8,),
            Text(
              "Total Price: ${flightController.flight.airFare * flightController.selectedSeats.length}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16.0,),
            Center(
              child: MaterialButton(
                onPressed: () {},
                child: Text("Pay with MPESA", style: TextStyle(color: Colors.white),),
                color: Colors.green[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
