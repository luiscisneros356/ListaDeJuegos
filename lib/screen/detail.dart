import 'package:animate_do/animate_do.dart';
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
        child: Column(
          children: [
            SafeArea(
              child: Hero(
                tag: juego.id,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: FadeInLeft(
                            delay: Duration(milliseconds: 500),
                            child: Icon(Icons.games)),
                        title: FadeInDown(
                          delay: Duration(milliseconds: 1000),
                          child: Text(
                            juego.title,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: FadeInRight(
                          delay: Duration(milliseconds: 1500),
                          child: Text(
                            "Juego desarrollado por ${juego.developer}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 50,
                          child: FadeInUp(
                            delay: Duration(milliseconds: 1900),
                            child: Divider(
                              color: Colors.orange.shade100,
                              thickness: 3,
                            ),
                          )),
                      FadeInUp(
                        delay: Duration(milliseconds: 2000),
                        child: Text(
                          juego.shortDescription,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                          height: 50,
                          child: FadeIn(
                            delay: Duration(milliseconds: 2100),
                            child: Divider(
                              color: Colors.orange.shade100,
                              thickness: 3,
                            ),
                          )),
                      FadeInUp(
                        delay: Duration(milliseconds: 2200),
                        child: ElevatedButton(
                            onPressed: () {
                              launch(juego.freetogameProfileUrl);
                            },
                            child: Text("Ver mas detalles")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          size: 35,
        ),
      ),
    );
  }
}
