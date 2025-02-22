class Stock {
  final int id;
  final String name;
  final String symbol;
  final String description;
  final String exchange;

  Stock({
    required this.id,
    required this.name,
    required this.symbol,
    required this.description,
    required this.exchange,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      description: json['description'],
      exchange: json['exchange'],
    );
  }
}