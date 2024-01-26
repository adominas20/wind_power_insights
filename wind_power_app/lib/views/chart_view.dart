import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wind_power_app/core/enums/dropdown_view_type.dart';
import 'package:wind_power_app/view_models/chart_view_model.dart';
import 'package:wind_power_app/widgets/chart.dart';
import 'package:wind_power_app/widgets/chart_dropdown_button.dart';

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChartViewModel>.reactive(
      onViewModelReady: (model) async {
        await model.loadData();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Chart View"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChartDropdownButton(
                model: model,
                viewType: DropdownViewType.location,
              ),
              ChartDropdownButton(
                model: model,
                viewType: DropdownViewType.measurement,
              ),
              Chart(model: model),
              ElevatedButton(onPressed: model.testMethod, child: Text("Test"))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChartViewModel(),
    );
  }
}
