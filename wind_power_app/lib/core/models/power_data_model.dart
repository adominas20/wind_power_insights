class PowerData {
  final String location;
  final double temperature;
  final double windSpeed;
  final double windDirection;
  final double power;

  PowerData(this.location, this.temperature, this.windSpeed, this.windDirection, this.power);

  factory PowerData.fromCsv(List<dynamic> csvRow, String location) {
    return PowerData(
      location,
      double.parse(csvRow[0].toString()),
      double.parse(csvRow[1].toString()),
      double.parse(csvRow[2].toString()),
      double.parse(csvRow[3].toString()),
    );
  }
}
