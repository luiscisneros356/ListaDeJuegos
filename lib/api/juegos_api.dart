import 'dart:convert';

import 'package:flutter_application_2/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<Juego>> getJuegos() async {
  final url = Uri.http("www.freetogame.com", "/api/games");

  final resp = await http.get(url);

  final juego = jsonDecode(resp.body).cast<Map<String, dynamic>>();

  return (juego.map<Juego>((json) => Juego.fromJson(json)).toList());
}
