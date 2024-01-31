class FilterDataModel {
  int? year;
  int? month;
  int? day;
  int? location;

  FilterDataModel(
    this.year,
    this.month,
    this.day,
    this.location,
  );

  Map<String, dynamic> toJson() {
    return {
      "year": year,
      "month": month,
      "day": day,
      "location": location,
    };
  }
}
