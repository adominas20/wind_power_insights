import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wind_power_app/view_models/chart_view_model.dart';
import 'package:wind_power_app/widgets/dropdown_button.dart';

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChartViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Chart View"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChartDropdownButton(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChartViewModel(),
    );
  }
}
