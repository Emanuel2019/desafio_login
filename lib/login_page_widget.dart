// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> insertRecord() async {
    if (name.text == "" || email.text == "" || password.text == "") {
      try {
        String uri = "http://localhost/practice_api/insert.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text
        });
        var response = jsonDecode(res);
        if (response["success"] == "true") {
          print('Registo feito com sucesso');
        }
      } catch (ex) {
        print(ex);
      }
    } else {
      print("Todos os campos devem estar preenchido");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture:
                      Image.asset('assets/images/477290_male.png'),
                  accountName: Text('Emanuel Ngola'),
                  accountEmail: Text('emanuelngola33@gmail.com')),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Regista de utilizador'),
        ),
        body: Column(
          children: [
            Container(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Escreva o nome do utilizador')),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Escreva o email do utilizador')),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Escreva a password')),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    insertRecord();
                  },
                  child: Text('Gravar')),
            ),
          ],
        ));
  }
}
