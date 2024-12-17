import 'package:flutter/material.dart';
import 'package:tasl/userModel.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.userInfo});
  final userModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(userInfo.name), Text(userInfo.gmail)],
      ),
    );
  }
}
