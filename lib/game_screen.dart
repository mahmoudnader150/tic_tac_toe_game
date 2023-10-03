import 'dart:async';
import 'dart:async';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/choose_screen.dart';
import 'package:tic_tac_toe/components.dart';
import 'package:tic_tac_toe/cubit.dart';
import 'package:tic_tac_toe/start_screen.dart';
import 'package:tic_tac_toe/states.dart';

class GameScreen extends StatelessWidget {

  Future<void> sleep(Duration duration) {
    // Create a Completer to manage the asynchronous task
    final Completer<void> completer = Completer<void>();

    // Create a Timer that completes the Completer after the specified duration
    Timer(duration, () {
      completer.complete();
    });

    // Return the Completer's Future
    return completer.future;
  }





  @override
  Widget build(BuildContext context) {
    String message = "";
    var cubit = GameCubit.get(context);
    return  BlocConsumer<GameCubit,GameStates>(
        listener: (context,state){
          if(state is ErrorChangGridGameState){
            showToast(text: "Choose another cell");
          }
          if(state is RowWinnerGameState ||
             state is ColumnWinnerGameState||
             state is DiagonalWinnerGameState||
             state is DrawGameState
          ){
            sleep(Duration(seconds: 1)).then((_) {
              cubit.clearGame();
            });
          }
        },
        builder: (context,state) {
          bool someOneWon(){
            if(state is RowWinnerGameState ||
                state is ColumnWinnerGameState||
                state is DiagonalWinnerGameState||
                state is DrawGameState
            ){
              return true;
            }
            return false;
          }
          return Scaffold(
            backgroundColor: HexColor("#050A30"),
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                navigateAndFinish(context, ChooseScreen());
                },
                icon: Icon(Icons.arrow_back_ios,color: cubit.turn?Colors.red:Colors.orangeAccent,),
              ),
            backgroundColor: HexColor("#050A30"),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  Text(
                    cubit.gameMessage(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    (cubit.turn)?"${cubit.PLAYER_ONE_NAME} turn":"${cubit.PLAYER_TWO_NAME} turn",
                    style: TextStyle(
                        color:(cubit.turn)?Colors.red:Colors.orange,
                       fontWeight: FontWeight.w500,
                      fontSize: 30
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                           if(cubit.turn){
                             cubit.changeGridValues(0, 0, cubit.PLAYER_ONE);
                           }else{
                             cubit.changeGridValues(0, 0, cubit.PLAYER_TWO);
                           }
                           cubit.checkWinner();
                        },
                          child: Container(
                            height: 100,
                            width: 100,
                            child:Center(
                              child: Text(
                                cubit.lettersGrid[0][0],
                                style:TextStyle(
                                    color: cubit.colorsGrid[0][0],
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold
                                ) ,),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.deepPurple,
                            ),
                          ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(0, 1, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(0, 1, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[0][1],
                              style:TextStyle(
                                  color: cubit.colorsGrid[0][1],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(0, 2, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(0, 2, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[0][2],
                              style:TextStyle(
                                  color: cubit.colorsGrid[0][2],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(1, 0, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(1, 0, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[1][0],
                              style:TextStyle(
                                  color: cubit.colorsGrid[1][0],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(1, 1, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(1, 1, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[1][1],
                              style:TextStyle(
                                  color: cubit.colorsGrid[1][1],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(1, 2, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(1, 2, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[1][2],
                              style:TextStyle(
                                  color: cubit.colorsGrid[1][2],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(2, 0, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(2, 0, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[2][0],
                              style:TextStyle(
                                  color: cubit.colorsGrid[2][0],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(2, 1, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(2, 1, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[2][1],
                              style:TextStyle(
                                  color: cubit.colorsGrid[2][1],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          if(someOneWon()) return;
                          if(cubit.turn){
                            cubit.changeGridValues(2, 2, cubit.PLAYER_ONE);
                          }else{
                            cubit.changeGridValues(2, 2, cubit.PLAYER_TWO);
                          }
                          cubit.checkWinner();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child:Center(
                            child: Text(
                              cubit.lettersGrid[2][2],
                              style:TextStyle(
                                  color: cubit.colorsGrid[2][2],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold
                              ) ,),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(
                      onPressed: () {
                        cubit.clearGame();
                      },
                    color: (cubit.turn)?Colors.red:Colors.orange,
                    child: Text(
                        "Reset",
                      style: TextStyle(
                        color:(!cubit.turn)?Colors.red:Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            )
          );
        }
    );
  }
}
