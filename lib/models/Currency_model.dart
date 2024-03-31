// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

List<Currency> currencyFromJson(String str) => List<Currency>.from(json.decode(str).map((x) => Currency.fromJson(x)));

String currencyToJson(List<Currency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Currency {
  int id;
  String currentPrice;
  String minPrice;
  PercentChange percentChange;
  String maxPrice;
  String name;
  String date;
  String priceChange;
  DateTime createdAt;

  Currency({
    required this.id,
    required this.currentPrice,
    required this.minPrice,
    required this.percentChange,
    required this.maxPrice,
    required this.name,
    required this.date,
    required this.priceChange,
    required this.createdAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    currentPrice: json["current_price"],
    minPrice: json["min_price"],
    percentChange: percentChangeValues.map[json["percent_change"]]!,
    maxPrice: json["max_price"],
    name: json["name"],
    date: json["date"],
    priceChange: json["price_change"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "current_price": currentPrice,
    "min_price": minPrice,
    "percent_change": percentChangeValues.reverse[percentChange],
    "max_price": maxPrice,
    "name": name,
    "date": date,
    "price_change": priceChange,
    "created_at": createdAt.toIso8601String(),
  };
}

enum PercentChange {
  THE_0,
  THE_053,
  THE_058,
  THE_06
}

final percentChangeValues = EnumValues({
  "0%": PercentChange.THE_0,
  "0.53%": PercentChange.THE_053,
  "0.58%": PercentChange.THE_058,
  "0.6%": PercentChange.THE_06
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
