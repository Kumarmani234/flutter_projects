class Guest {
  final String guestName;
  final String purpose_of_visit;
  final String address;
  final String image;
  final String assigned_to;

  Guest({
    required this.guestName,
    required this.purpose_of_visit,
    required this.address,
    required this.image,
    required this.assigned_to,
  });

  factory Guest.fromJson(Map<dynamic, dynamic> json) {
    return Guest(
      guestName: json['guestName'],
      purpose_of_visit: json['purpose_of_visit'],
      address: json['address'],
      image: json['image'],
      assigned_to: json['assigned_to'],
    );
  }
}

