class Stock {
  int? ID;
  String? name;
  String? ticker;
  double? value;
  double? variation;
  String? signal; // - ou +

  Stock({
    this.ID,
    this.name,
    this.ticker,
    this.value,
    this.variation,
    this.signal
  });
}