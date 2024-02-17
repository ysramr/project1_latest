// main_page.dart
import 'package:flutter/material.dart';
import 'room_selection.dart';

class MainPage extends StatelessWidget {
  final String name;
  final String phoneNumber;

  MainPage({required this.name, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meeting Room')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome, $name!'),
            SizedBox(height: 20),
            RoomSelection(name: name),
          ],
        ),
      ),
    );
  }
}
