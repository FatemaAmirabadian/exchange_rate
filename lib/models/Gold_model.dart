// To parse this JSON data, do
//
//     final gold = goldFromJson(jsonString);

import 'dart:convert';

List<Gold> goldFromJson(String str) => List<Gold>.from(json.decode(str).map((x) => Gold.fromJson(x)));

String goldToJson(List<Gold> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gold {
  int id;
  String uniqueName;
  int displayPriority;
  String name;
  String logoUrl;

  Gold({
    required this.id,
    required this.uniqueName,
    required this.displayPriority,
    required this.name,
    required this.logoUrl,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
    id: json["id"],
    uniqueName: json["unique_name"],
    displayPriority: json["display_priority"],
    name: json["name"],
    logoUrl: json["logo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unique_name": uniqueName,
    "display_priority": displayPriority,
    "name": name,
    "logo_url": logoUrl,
  };
}
