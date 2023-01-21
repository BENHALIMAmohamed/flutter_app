import 'package:flutter/material.dart';

class AuthentificationPage extends StatelessWidget {
  const AuthentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtlogin = TextEditingController();
    TextEditingController txtpassword = TextEditingController();
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
                  onPressed: () {},
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
}
