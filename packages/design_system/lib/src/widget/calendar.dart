

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RTCalendar extends StatefulWidget {
  const RTCalendar({super.key});

  @override
  State<RTCalendar> createState() => _RTCalendarState();
}

class _RTCalendarState extends State<RTCalendar> {

  final today = DateTime.now().atTime();
  final int _weekDiff = 0;

  String _parseDayString(DateTime date) {
    final str = DateFormat.E().format(date);
    if(str.length > 1) {
      return str.substring(0,2);
    } else {
      return str;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (i) {

        final date = today.add(Duration(days: i-today.weekday+1 + _weekDiff*7));
        // final isBefore = date.difference(today).inDays < 0;

        // final backColor = _selectedDay == i ? Colors.blue : isBefore ? const Color(0xFFE3DDE8) : Colors.transparent;
        // final fontColor = _selectedDay == i ? Colors.white : isBefore ? const Color(0xFF454545) : Colors.black;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.grey,
              // borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Text(
                '${date.day}',
                style: TextStyle(
                  fontSize: 16,
                  fontFeatures: [
                    FontFeature('tnum')
                  ]
                  // fontWeight: FontWeight.w300,
                  // color: fontColor
                ),
              ),
              Text(
                _parseDayString(date),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


extension on DateTime {

  DateTime atTime() {
    return copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  }

}
