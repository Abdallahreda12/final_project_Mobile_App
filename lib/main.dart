import 'package:flutter/material.dart';
import 'package:tasl/SignIn.dart';
import 'package:tasl/userModel.dart';

List<userModel> userList = [];
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
