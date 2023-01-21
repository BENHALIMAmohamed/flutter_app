import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Home")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () {
              _Deconnection(context);
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                padding: const EdgeInsets.all(15)),
            child: const Text(
              'Deconnection',
              style: TextStyle(fontSize: 22),
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> _Deconnection(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamedAndRemoveUntil('authentification', (Route<dynamic> route) => false);
  }
}
