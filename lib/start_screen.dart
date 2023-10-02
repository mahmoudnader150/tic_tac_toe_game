import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#050A30"),
      appBar: AppBar(
        backgroundColor:HexColor("#050A30") ,
        elevation: 0.0,
        title: Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image:AssetImage("assets/xo.jpg"),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Player vs. Player",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white
                    ),
                   ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Player vs. Device",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
