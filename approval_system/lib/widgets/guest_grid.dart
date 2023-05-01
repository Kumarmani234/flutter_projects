import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'guest_card.dart';


class GuestGrid extends StatefulWidget {
  @override
  _GuestGridState createState() => _GuestGridState();
}

class _GuestGridState extends State<GuestGrid> {
  List<dynamic> _guests = [];

  @override
  void initState() {
    super.initState();
    _fetchGuests();
  }

  Future<void> _fetchGuests() async {
    var response =await http.get(Uri.parse('http://10.0.2.2.8000/api/Guests'));
    if (response.statusCode == 200) {
       setState(() {
        _guests = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch guests');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: _guests.length,
      itemBuilder: (context, index) {
        return GuestCard(guest: _guests[index]);
      },
    );
  }
}
