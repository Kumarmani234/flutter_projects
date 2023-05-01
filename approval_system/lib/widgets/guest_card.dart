import 'package:flutter/material.dart';


import '../Models/Guest.dart';

class GuestCard extends StatelessWidget {
  final Guest guest;

  GuestCard({required this.guest});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(guest.image),
          Text(guest.guestName),
          Text(guest.purpose_of_visit),
          Text(guest.address),
          Text(guest.image),
          Text(guest.assigned_to),
        ],
      ),
    );
  }
}
