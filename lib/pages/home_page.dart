import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: Text("Usta esta Logueado",style: TextStyle(fontSize: 16),)),
      )
    );
  }
}