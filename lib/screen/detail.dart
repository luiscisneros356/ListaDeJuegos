import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Juego juego = ModalRoute.of(context)!.settings.arguments as Juego;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SafeArea(
              child: Hero(
                tag: juego.id,
                child: Container(
                  width: double.infinity,
                  height: 700,
                  child: Image.network(
                    juego.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            CustomCard(juego: juego),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.juego,
  }) : super(key: key);

  final Juego juego;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              juego.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Juego desarrollado por ${juego.developer}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              juego.shortDescription,
              style: TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  launch(juego.freetogameProfileUrl);
                },
                child: Text("Ver mas detalles")),
          ],
        ),
      ),
    );
  }
}
