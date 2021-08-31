// To parse this JSON data, do
//
//     final juego = juegoFromJson(jsonString);

import 'dart:convert';

List<Juego> juegoFromJson(String str) =>
    List<Juego>.from(json.decode(str).map((x) => Juego.fromJson(x).toJson()));

String juegoToJson(List<Juego> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Juego {
  Juego({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  int id;
  String title;
  String thumbnail;
  String shortDescription;
  String gameUrl;

  String publisher;
  String developer;
  DateTime releaseDate;
  String freetogameProfileUrl;

  factory Juego.fromJson(Map<String, dynamic> json) => Juego(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": shortDescription,
        "game_url": gameUrl,
        "publisher": publisher,
        "developer": developer,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "freetogame_profile_url": freetogameProfileUrl,
      };
}
