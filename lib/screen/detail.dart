import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Juego juego = ModalRoute.of(context)!.settings.arguments as Juego;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SafeArea(
            child: Hero(
              tag: juego.id,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    juego.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Colors.indigo.shade100, Colors.indigo.shade200])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      juego.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Juego desarrollado por ${juego.developer}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      juego.shortDescription,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          launch(juego.freetogameProfileUrl);
                        },
                        child: Text("Ver mas detalles")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
