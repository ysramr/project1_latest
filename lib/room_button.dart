// room_button.dart
import 'package:flutter/material.dart';
import 'date_time_selection.dart';

class RoomButton extends StatelessWidget {
  final int roomNumber;
  final String name;

  RoomButton({required this.roomNumber, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DateTimeSelection(
              name: name,
              roomNumber: roomNumber,
            ),
          ),
        );
      },
      child: Text('Room $roomNumber'),
    );
  }
}
