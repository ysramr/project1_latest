import 'package:flutter/material.dart';

class DateTimeSelection extends StatefulWidget {
  final String name;
  final int roomNumber;

  DateTimeSelection({required this.name, required this.roomNumber});

  @override
  _DateTimeSelectionState createState() => _DateTimeSelectionState();
}

class _DateTimeSelectionState extends State<DateTimeSelection> {
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<DateTimeRange?> pickDateRange() async => showDateRangePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialDateRange: startDate != null && endDate != null
            ? DateTimeRange(start: startDate!, end: endDate!)
            : null,
      );

  Future<TimeOfDay?> pickTime() async => showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date and Time Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTimeRange? pickedRange = await pickDateRange();

                if (pickedRange != null) {
                  setState(() {
                    startDate = pickedRange.start;
                    endDate = pickedRange.end;
                  });
                }
              },
              child: Text('Select Date Range'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? picked = await pickTime();

                if (picked != null && picked != selectedTime) {
                  setState(() {
                    selectedTime = picked;
                  });
                }
              },
              child: Text('Select Time'),
            ),
            SizedBox(height: 20),
            // Display the selected date and time
            startDate != null && endDate != null
                ? Text('Selected Date Range: ${startDate!.toLocal()} - ${endDate!.toLocal()}')
                : Container(),
            Text('Selected Time: ${selectedTime.format(context)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Booking Accepted!'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Thank you, ${widget.name}!\n'
                            'Room: ${widget.roomNumber}\n'
                            'Date Range: ${startDate?.toLocal()} - ${endDate?.toLocal()}\n'
                            'Time: ${selectedTime.format(context)}',
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Accept Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
