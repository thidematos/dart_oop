class Transactions {
  Transactions(this.type,
      {required this.origin, this.destination = '', required this.value});

  String type;
  String origin;
  String destination;
  double value;
  DateTime time = DateTime.now();
}
