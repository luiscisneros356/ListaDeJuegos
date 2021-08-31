import 'package:flutter/material.dart';

import 'package:flutter_application_2/screen/detail.dart';
import 'package:flutter_application_2/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "home",
      routes: {"home": (_) => Home(), "detail": (_) => Details()},
    );
  }
}
