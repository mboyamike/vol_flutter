import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/models/seats.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'models/flight.dart';

class FlightsPage extends StatefulWidget {
  @override
  _FlightsPageState createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  List<String> places = ["Nairobi", "Mombasa", "Kisumu"];
  List<Flight> flights = [];
  LocationController _locationController = Get.find();

  List<Flight> getFlights() {
    return List.generate(
        5,
        (index) => Flight(
              origin: _locationController.origin,
              destination: _locationController.destination,
              id: index,
            ),
    );
  }

  @override
  void initState() {
    flights = getFlights();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Flights'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Flight flight = flights[index];

                  return FlatButton(
                    onPressed: () {
                      Get.put(FlightController(flight: flight));
                      Get.to(SeatsPage());
                    },
                    onLongPress: () {
                      Get.snackbar("Tap to select", "Tap once to select this flight", snackPosition: SnackPosition.BOTTOM);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.0,),
                        Center(
                          child: Text(
                            flight.airline,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From: ${flight.origin}"),
                                Text(
                                    "Departing at: ${DateFormat.yMMMd().format(flight.departureTime)} ${DateFormat.Hm().format(flight.departureTime)} hrs"),
                              ],
                            ),
                            Text(
                              "sh ${flight.airFare.round().toString()}",
                              style: TextStyle(fontSize: 22, color: Colors.green),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("To: ${flight.destination}"),
                        Text(
                            "Arriving at: ${DateFormat.yMMMd().format(flight.arrivalTime)} ${DateFormat.Hm().format(flight.arrivalTime)} hrs"),
                        SizedBox(height: 12.0,),
                        Divider(color: Colors.blue,),
                      ],
                    ),
                  );
                },
                itemCount: flights.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightController extends GetxController {
  Flight flight;
  List<int> selectedSeats = [];

  FlightController({@required this.flight});
}