// To parse this JSON data, do
//
//     final exchange = exchangeFromJson(jsonString);

import 'dart:convert';

List<Exchange> exchangeFromJson(String str) => List<Exchange>.from(json.decode(str).map((x) => Exchange.fromJson(x)));

String exchangeToJson(List<Exchange> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exchange {
  int id;
  String currentPrice;
  String minPrice;
  String percentChange;
  DateTime createdAt;
  String date;
  String maxPrice;
  String priceChange;
  CurrencyInfo? currencyInfo;
  int? currencyId;
  String? name;
  dynamic infoId;
  dynamic info;

  Exchange({
    required this.id,
    required this.currentPrice,
    required this.minPrice,
    required this.percentChange,
    required this.createdAt,
    required this.date,
    required this.maxPrice,
    required this.priceChange,
    this.currencyInfo,
    this.currencyId,
    this.name,
    this.infoId,
    this.info,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
    id: json["id"],
    currentPrice: json["current_price"],
    minPrice: json["min_price"],
    percentChange: json["percent_change"],
    createdAt: DateTime.parse(json["created_at"]),
    date: json["date"],
    maxPrice: json["max_price"],
    priceChange: json["price_change"],
    currencyInfo: json["currency_info"] == null ? null : CurrencyInfo.fromJson(json["currency_info"]),
    currencyId: json["currency_id"],
    name: json["name"],
    infoId: json["info_id"],
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "current_price": currentPrice,
    "min_price": minPrice,
    "percent_change": percentChange,
    "created_at": createdAt.toIso8601String(),
    "date": date,
    "max_price": maxPrice,
    "price_change": priceChange,
    "currency_info": currencyInfo?.toJson(),
    "currency_id": currencyId,
    "name": name,
    "info_id": infoId,
    "info": info,
  };
}

class CurrencyInfo {
  String persianName;
  int id;
  String alphabetCode;
  String country;
  String engName;
  String logoUrl;

  CurrencyInfo({
    required this.persianName,
    required this.id,
    required this.alphabetCode,
    required this.country,
    required this.engName,
    required this.logoUrl,
  });

  factory CurrencyInfo.fromJson(Map<String, dynamic> json) => CurrencyInfo(
    persianName: json["persian_name"],
    id: json["id"],
    alphabetCode: json["alphabet_code"],
    country: json["country"],
    engName: json["eng_name"],
    logoUrl: json["logo_url"],
  );

  Map<String, dynamic> toJson() => {
    "persian_name": persianName,
    "id": id,
    "alphabet_code": alphabetCode,
    "country": country,
    "eng_name": engName,
    "logo_url": logoUrl,
  };
}
