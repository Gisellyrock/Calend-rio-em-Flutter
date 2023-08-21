import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Dom',
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sáb'
  ];
  final List<int> daysInMonth = List<int>.generate(31, (index) => index + 1);
  final int currentMonth = 8; // August
  final int currentYear = 2023;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário Agosto 2023'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: daysOfWeek.length + daysInMonth.length,
        itemBuilder: (context, index) {
          if (index < daysOfWeek.length) {
            // Display days of the week
            return Center(
              child: Text(
                daysOfWeek[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          } else {
            // Display days of the month
            final dayOfMonth = daysInMonth[index - daysOfWeek.length];
            final currentDate = DateTime(currentYear, currentMonth, dayOfMonth);
            return GestureDetector(
              onTap: () {
                // Handle day selection
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                          '${currentDate.day} de agosto de ${currentDate.year}'),
                      content: Text('Você tocou no dia $dayOfMonth.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Center(
                child: Text(dayOfMonth.toString()),
              ),
            );
          }
        },
      ),
    );
  }
}
