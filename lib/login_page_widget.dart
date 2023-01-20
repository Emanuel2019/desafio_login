import 'package:flutter/material.dart';
class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader( currentAccountPicture: Image.network('https://icons8.com/icon/98957/user'),
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
  title: const  Text('Inglês fácil'),
),
body: Center(child: Text('Menu principal do sistema'),
),
    );
  }
}