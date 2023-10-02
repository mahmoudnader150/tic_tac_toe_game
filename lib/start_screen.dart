import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/choose_screen.dart';
import 'package:tic_tac_toe/components.dart';
import 'package:tic_tac_toe/cubit.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/states.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<GameCubit,GameStates>(
          listener: (context,state){},
      builder: (context,state) {
          var cubit =   GameCubit.get(context);
        return Scaffold(
          backgroundColor: HexColor("#050A30"),
          appBar: AppBar(
            backgroundColor: HexColor("#050A30"),
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
                Text(
                  "CHOOSE GAME MODE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),
                SizedBox(height: 10,),
                Image(
                  image: AssetImage("assets/xo.jpg"),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                    cubit.clearGame();
                    navigateTo(context, GameScreen());
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
                  onTap: () {

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
    );
  }
}
