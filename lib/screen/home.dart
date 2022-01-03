import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/juegos_api.dart';
import 'package:flutter_application_2/models/models.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getJuegos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Catalogo de Juegos",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.indigo.shade100,
        body: FutureBuilder(
          future: getJuegos(),
          builder: (BuildContext context, AsyncSnapshot<List<Juego>> snapshot) {
            if (snapshot.hasData)
              return Swiper(
                itemCount: snapshot.data!.length,
                viewportFraction: 0.8,
                scale: 0.85,
                itemHeight: 600,
                itemWidth: 100,
                itemBuilder: (BuildContext context, int index) {
                  final juego = snapshot.data![index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "detail",
                              arguments: juego);
                        },
                        child: Hero(
                          tag: juego.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 400,
                              width: 400,
                              child: FadeInImage(
                                placeholder: AssetImage("assets/giphy.gif"),
                                image: NetworkImage(juego.thumbnail),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        juego.title,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                },
              );
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
