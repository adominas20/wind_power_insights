import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wind_power_app/core/enums/dropdown_view_type.dart';
import 'package:wind_power_app/view_models/chart_view_model.dart';
import 'package:wind_power_app/widgets/chart.dart';
import 'package:wind_power_app/widgets/chart_dropdown_button.dart';
import 'package:wind_power_app/widgets/time_period_selector.dart';

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
              const SmallHeader(title: "Filters:"),
              ChartDropdownButton(
                model: model,
                viewType: DropdownViewType.location,
              ),
              ChartDropdownButton(
                model: model,
                viewType: DropdownViewType.measurement,
              ),
              const SmallHeader(title: "View Type:"),
              const TimePeriodSelector(),
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

class SmallHeader extends StatelessWidget {
  const SmallHeader({this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
          child: Text(
            title ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
