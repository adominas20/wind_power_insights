import 'package:flutter/material.dart';

enum TimePeriod { year, month, day }

class TimePeriodSelector extends StatefulWidget {
  const TimePeriodSelector({super.key});

  @override
  State<TimePeriodSelector> createState() => _TimePeriodSelectorState();
}

class _TimePeriodSelectorState extends State<TimePeriodSelector> {
  TimePeriod _selectedTimePeriod = TimePeriod.year;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: RadioListTile<TimePeriod>(
            title: const Text('Year'),
            value: TimePeriod.year,
            groupValue: _selectedTimePeriod,
            onChanged: (TimePeriod? value) {
              setState(() {
                _selectedTimePeriod = value!;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile<TimePeriod>(
            title: const Text('Month'),
            value: TimePeriod.month,
            groupValue: _selectedTimePeriod,
            onChanged: (TimePeriod? value) {
              setState(() {
                _selectedTimePeriod = value!;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile<TimePeriod>(
            title: const Text('Day'),
            value: TimePeriod.day,
            groupValue: _selectedTimePeriod,
            onChanged: (TimePeriod? value) {
              setState(() {
                _selectedTimePeriod = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
