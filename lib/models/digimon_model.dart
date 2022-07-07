import 'dart:convert';

List<Digimon> digimonsFromJson(String str) =>
    List<Digimon>.from(json.decode(str).map((x) => Digimon.fromJson(x)));

String digimonsToJson(List<Digimon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Digimon {
  Digimon({
    required this.name,
    required this.img,
    required this.level,
  });

  String name;
  String img;
  String level;

  factory Digimon.fromJson(Map<String, dynamic> json) => Digimon(
        name: json["name"] ?? '',
        img: json["img"] ?? '',
        level: json["level"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "level": level,
      };
}
