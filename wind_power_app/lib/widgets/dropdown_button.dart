import 'package:flutter/material.dart';

class ChartDropdownButton extends StatefulWidget {
  const ChartDropdownButton({super.key});

  @override
  State<ChartDropdownButton> createState() => _ChartDropdownButtonState();
}

class _ChartDropdownButtonState extends State<ChartDropdownButton> {
  String dropdownValue = 'Location 1';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.deepPurple, width: 2),
            color: Colors.white,
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Location 1', 'Location 2', 'Location 3', 'Location 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
