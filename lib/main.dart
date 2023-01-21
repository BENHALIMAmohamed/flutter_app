import 'package:flutter/material.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/authentification.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routes = {
    '/home': (context) => const HomePage(),
    '/inscription': (context) => const InscriptionPage(),
    '/authentification': (context) => const AuthentificationPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InscriptionPage(),
      routes: routes,
    );
  }
}
