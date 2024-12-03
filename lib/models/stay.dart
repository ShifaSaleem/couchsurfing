import 'destination.dart';

class Stay {
  final String hostName;
  final String location;
  final DateTime date;
  final bool isUpcoming;
  final Destination destination;

  Stay({
    required this.hostName,
    required this.location,
    required this.date,
    required this.isUpcoming,
    required this.destination,
  });
}
