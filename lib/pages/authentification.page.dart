import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AuthentificationPage extends StatelessWidget {
  AuthentificationPage({super.key});
  TextEditingController txtlogin = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  late SharedPreferences prefs = prefs;

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
                    _onAuthentifier(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      padding: const EdgeInsets.all(15)),
                  child: const Text(
                    'Connection',
                    style: TextStyle(fontSize: 22),
                  )),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 22),
              ),
              child: const Text("j'ai pas un compt, inscription"),
            )
          ],
        ));
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    String LogLogin = prefs.getString("login") ?? "";
    // ignore: non_constant_identifier_names
    String LogPassword = prefs.getString("password") ?? "";
    if (txtlogin.text == LogLogin && txtpassword.text == LogPassword) {
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
