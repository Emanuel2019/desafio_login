import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateData extends StatefulWidget {
  String name;
  String email;
  String password;
  UpdateData(this.name, this.email, this.password);

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void iniState() {
    name.text = widget.name;
    email.text = widget.email;
    password.text = widget.password;

    super.initState();
  }

  Future<void> updaterecord() async {
    try {
      String uri = "http://localhost/practice_api/update.php";
      var res = await http.post(Uri.parse(uri), body: {
        'name': name.text,
        'email': email.text,
        'password': password.text
      });
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print('Registo actualizado com sucesso!');
      } else {
        print('Registo não foi actualizado com sucesso');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar utilizador')),
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
                  border: OutlineInputBorder(), ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  updaterecord();
                },
                child: Text('Gravar')),
          ),
        ],
      ),
    );
  }
}
