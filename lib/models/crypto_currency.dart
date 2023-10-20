class CryptoCurrency {
  int? ID;
  String? name;
  double? marketValue;
  double? value;
  double? variation;
  String? signal; // - ou +

  CryptoCurrency({
    this.ID,
    this.name,
    this.marketValue,
    this.value,
    this.variation,
    this.signal
  });
}