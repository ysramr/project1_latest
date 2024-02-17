// room_selection.dart
import 'package:flutter/material.dart';
import 'room_button.dart';

class RoomSelection extends StatelessWidget {
  final String name;

  RoomSelection({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        10,
        (index) => RoomButton(roomNumber: index + 1, name: name),
      ),
    );
  }
}
