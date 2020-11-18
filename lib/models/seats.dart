import 'package:flutter/material.dart';
import 'package:flutter_app/flights.dart';
import 'package:flutter_app/payments.dart';
import 'package:get/get.dart';

class SeatsPage extends StatefulWidget {
  @override
  _SeatsPageState createState() => _SeatsPageState();
}

class _SeatsPageState extends State<SeatsPage> {
  List<int> selectedSeats = [];
  List<int> bookedSeats = [1, 2, 3, 5, 6];

  FlightController flightController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your preferred Seat(s)"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  Color color;

                  if (bookedSeats.contains(index)) {
                    color = Colors.red;
                  } else if (selectedSeats.contains(index)) {
                    color = Colors.orange;
                  } else
                    color = Colors.green;
                  if (index % 5 == 2) return Container();
                  return GestureDetector(
                    onTap: () {
                      if (color == Colors.green) {
                        setState(() {
                          selectedSeats.add(index);
                        });
                        print(selectedSeats);
                      } else if (color == Colors.orange)
                        setState(() {
                          selectedSeats.remove(index);
                        });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      color: color,
                    ),
                  );
                },
                itemCount: 35,
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text("Key", style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.green,
                      height: 30,
                      width: 30,
                    ),
                    Text("Available Seat"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.orange,
                      height: 30,
                      width: 30,
                    ),
                    Text("Selected Seat"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 30,
                      width: 30,
                    ),
                    Text("Unavailable Seat"),
                  ],
                ),
              ],
            ),
            MaterialButton(
              onPressed: bookSeats,
              color: Theme.of(context).primaryColor,
              child: Text("Book seat(s)", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  void bookSeats() {
    if (selectedSeats.isEmpty)
      Get.snackbar("No seat Selected", "Please select at least 1 seat",
          duration: Duration(seconds: 3), snackPosition: SnackPosition.BOTTOM);
    else {
      flightController.selectedSeats = selectedSeats;
      Get.to(PaymentsPage());
    }
  }
}
