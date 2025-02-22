class StockPriceGraph {
  final List<double> price;
  final List<DateTime> timestamps;
  final String range;
  final String symbol;

  StockPriceGraph({
    required this.price,
    required this.timestamps,
    required this.range,
    required this.symbol,
  });

  factory StockPriceGraph.fromJson(Map<String, dynamic> json) {
    return StockPriceGraph(
      price: List<double>.from(json['price']),
      timestamps: List<int>.from(json['timestamp'])
          .map((ts) => DateTime.fromMillisecondsSinceEpoch(ts * 1000))
          .toList(),
      range: json['range'],
      symbol: json['symbol'],
    );
  }
}
