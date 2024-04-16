// To parse this JSON data, do
//
//     final gold = goldFromJson(jsonString);

import 'dart:convert';

List<Gold> goldFromJson(String str) => List<Gold>.from(json.decode(str).map((x) => Gold.fromJson(x)));

String goldToJson(List<Gold> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gold {
  String date;
  String maxPrice;
  String priceChange;
  String currentPrice;
  int id;
  String minPrice;
  String percentChange;
  DateTime createdAt;
  GoldInfo goldInfo;
  int goldId;

  Gold({
    required this.date,
    required this.maxPrice,
    required this.priceChange,
    required this.currentPrice,
    required this.id,
    required this.minPrice,
    required this.percentChange,
    required this.createdAt,
    required this.goldInfo,
    required this.goldId,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
    date: json["date"],
    maxPrice: json["max_price"],
    priceChange: json["price_change"],
    currentPrice: json["current_price"],
    id: json["id"],
    minPrice: json["min_price"],
    percentChange: json["percent_change"],
    createdAt: DateTime.parse(json["created_at"]),
    goldInfo: GoldInfo.fromJson(json["gold_info"]),
    goldId: json["gold_id"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "max_price": maxPrice,
    "price_change": priceChange,
    "current_price": currentPrice,
    "id": id,
    "min_price": minPrice,
    "percent_change": percentChange,
    "created_at": createdAt.toIso8601String(),
    "gold_info": goldInfo.toJson(),
    "gold_id": goldId,
  };
}

class GoldInfo {
  String name;
  int displayPriority;
  String uniqueName;
  int id;
  String logoUrl;

  GoldInfo({
    required this.name,
    required this.displayPriority,
    required this.uniqueName,
    required this.id,
    required this.logoUrl,
  });

  factory GoldInfo.fromJson(Map<String, dynamic> json) => GoldInfo(
    name: json["name"],
    displayPriority: json["display_priority"],
    uniqueName: json["unique_name"],
    id: json["id"],
    logoUrl: json["logo_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "display_priority": displayPriority,
    "unique_name": uniqueName,
    "id": id,
    "logo_url": logoUrl,
  };
}
