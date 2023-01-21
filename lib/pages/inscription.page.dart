import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class InscriptionPage extends StatelessWidget {
  InscriptionPage({super.key});
  late SharedPreferences prefs;
  TextEditingController txtlogin = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Page Authentification")),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: txtlogin,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Utilisateur",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  obscureText: true,
                  controller: txtpassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    _onInscrire(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      padding: const EdgeInsets.all(15)),
                  child: const Text(
                    'inscription',
                    style: TextStyle(fontSize: 22),
                  )),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/authentification');
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 22),
              ),
              child: const Text("j'ai deja un compt"),
            )
          ],
        ));
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    // ignore: duplicate_ignore
    if (txtlogin.text.isNotEmpty && txtpassword.text.isNotEmpty) {
      prefs.setString("login", txtlogin.text);
      prefs.setString("password", txtpassword.text);
      prefs.setBool("connecte", true);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(content: Text('Id ou mot de passe vides'));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
