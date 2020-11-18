class Flight {
  String destination;
  String origin;
  int id;
  DateTime departureTime;
  DateTime arrivalTime;
  String airline;
  double airFare;

  Flight(
      {this.destination  = "Nairobi",
      this.origin = "Kisumu",
      this.departureTime,
      this.arrivalTime,
      this.airline = "Kenya Airways",
      this.id = 0,
      this.airFare = 5000}) {
    this.departureTime ??= DateTime.now().add(Duration(days: 1, hours: 2));
    this.arrivalTime ??= DateTime.now().add(Duration(days: 1, hours: 3));
  }
}
