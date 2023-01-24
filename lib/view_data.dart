import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'update_data.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  List userdata = [];
  Future<void> deleterecord(String id) async {
    try {
      String uri = "http://localhost/practice_api/delete.php";
      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print('Utilizador excluido com sucess0!');
        getrecord();
      } else {
        print('Utilizador não foi excluido com sucesso');
        getrecord();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getrecord() async {
    String uri = 'http://localhost/practice_api/';
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    getrecord();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ver registo')),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateData(userdata[index]["name"],
                    userdata[index]["email"],
                    userdata[index]["password"],
                    )));
              }),
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text(userdata[index]['name']),
              subtitle: Text(userdata[index]['email']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleterecord(userdata[index]['id']);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
