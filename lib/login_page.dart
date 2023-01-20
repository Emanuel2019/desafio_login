import 'package:flutter/material.dart';
import 'login_page_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String _title = 'Desafio';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: LoginPageWidget(),
    );
  }
}
