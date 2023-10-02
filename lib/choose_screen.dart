import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#050A30"),
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
              "Player One Choose X or O :",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30
            ),
          )
        ],
      ),
    );
  }
}
