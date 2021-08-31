import 'package:card_swiper/card_swiper.dart';
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
        backgroundColor: Colors.grey.shade300,
        body: FutureBuilder(
          future: getJuegos(),
          builder: (BuildContext context, AsyncSnapshot<List<Juego>> snapshot) {
            if (snapshot.hasData)
              return Swiper(
                itemCount: snapshot.data!.length,
                layout: SwiperLayout.STACK,
                itemHeight: 500,
                itemWidth: 300,
                itemBuilder: (BuildContext context, int index) {
                  final juego = snapshot.data![index];

                  return GestureDetector(
                    onTap: () {
                      print(juego.title);
                      Navigator.pushNamed(context, "detail", arguments: juego);
                    },
                    child: Hero(
                      tag: juego.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: AssetImage("assets/giphy.gif"),
                          image: NetworkImage(juego.thumbnail),
                          height: 500,
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
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