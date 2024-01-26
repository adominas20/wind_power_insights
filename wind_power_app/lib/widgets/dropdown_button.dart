import 'package:flutter/material.dart';
import 'package:wind_power_app/view_models/chart_view_model.dart';

class ChartDropdownButton extends StatefulWidget {
  const ChartDropdownButton({super.key, this.model});

  final ChartViewModel? model;

  @override
  State<ChartDropdownButton> createState() => _ChartDropdownButtonState();
}

class _ChartDropdownButtonState extends State<ChartDropdownButton> {
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
            value: widget.model!.selectedLocation,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
            onChanged: (String? newValue) {
              setState(() {
                widget.model!.selectedLocation = newValue!;
              });
            },
            items: widget.model!.locations.map<DropdownMenuItem<String>>((String value) {
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
