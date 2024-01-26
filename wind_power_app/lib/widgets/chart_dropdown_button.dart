import 'package:flutter/material.dart';
import 'package:wind_power_app/core/enums/dropdown_view_type.dart';
import 'package:wind_power_app/view_models/chart_view_model.dart';

class ChartDropdownButton extends StatefulWidget {
  const ChartDropdownButton({super.key, this.model, this.viewType});

  final ChartViewModel? model;
  final DropdownViewType? viewType;

  @override
  State<ChartDropdownButton> createState() => _ChartDropdownButtonState();
}

class _ChartDropdownButtonState extends State<ChartDropdownButton> {
  List<String>? values;

  void _setViewType() {
    switch (widget.viewType) {
      case DropdownViewType.location:
        values = widget.model!.locations;
        break;
      case DropdownViewType.measurement:
        values = widget.model!.measurements;
        break;
      default:
        //TODO: Throw some kind of error
        break;
    }
  }

  String _getSelectedValue() {
    switch (widget.viewType) {
      case DropdownViewType.location:
        return widget.model!.selectedLocation;
      case DropdownViewType.measurement:
        return widget.model!.selectedMeasurement;
      default:
        //TODO: Throw error instead
        return "";
    }
  }

  void _setSelectedValue(String newValue) {
    switch (widget.viewType) {
      case DropdownViewType.location:
        widget.model!.selectedLocation = newValue;
        break;
      case DropdownViewType.measurement:
        widget.model!.selectedMeasurement = newValue;
      default:
        //TODO: Throw some kind of error
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setViewType();

    String selectedValue = _getSelectedValue();

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
            value: selectedValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
            onChanged: (String? newValue) {
              setState(() {
                _setSelectedValue(newValue!);
              });
            },
            items: values!.map<DropdownMenuItem<String>>((String value) {
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
