import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/flights.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationController locations = Get.put(LocationController());
  List<String> places = ["Kisumu", "Nairobi", "Mombasa"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vol"),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "New Flight",
              ),
              Tab(
                text: "My Flights",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("To: "),
                  SizedBox(
                    height: 8.0,
                  ),
                  DropdownButton(
                    isExpanded: true,
                    value: locations.destination,
                    items: places
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    hint: Text("Select the town you'd like to visit"),
                    onChanged: (value) {
                      setState(() {
                        locations.destination = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("From: "),
                  SizedBox(
                    height: 8.0,
                  ),
                  DropdownButton(
                    isExpanded: true,
                    value: locations.origin,
                    items: places
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    hint: Text("Select the town you're travelling from"),
                    onChanged: (value) {
                      setState(() {
                        locations.origin = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if(locations.origin == locations.destination) {
                          Get.snackbar("Location Error",
                              "Please select a different location for origin and destination",
                              snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        } else if(locations.origin == "" || locations.destination == "") {
                          Get.snackbar("Select locations",
                              "Please select where you're coming from and where you're going to",
                              snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }
                        Get.to(FlightsPage());
                      },
                      child: Text(
                        "Book a flight",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(child: Text("Your Booked flights will come here")),
            )
          ],
        ),
      ),
    );
  }
}

class LocationController extends GetxController {
  String origin = "Nairobi";
  String destination = "Kisumu";
}