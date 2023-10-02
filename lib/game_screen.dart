import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/components.dart';
import 'package:tic_tac_toe/cubit.dart';
import 'package:tic_tac_toe/start_screen.dart';
import 'package:tic_tac_toe/states.dart';

class GameScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String message = "";
    return  BlocConsumer<GameCubit,GameStates>(
        listener: (context,state){
          if(state is ErrorChangGridGameState){
            showToast(text: "Choose another cell");
          }
          if(state is DrawGameState){
              message ="DRAW!";
          }
        },
        builder: (context,state) {
          var cubit = GameCubit.get(context);
          return Scaffold(
            backgroundColor: HexColor("#050A30"),
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                navigateAndFinish(context, StartScreen());
                },
                icon: Icon(Icons.arrow_back_ios,color: Colors.redAccent,),
              ),
            backgroundColor: HexColor("#050A30"),
              elevation: 0,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  (cubit.turn)?"Player X turn":"Player O turn",
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
                         if(cubit.turn){
                           cubit.changeGridValues(0, 0, cubit.PLAYER_ONE);
                         }else{
                           cubit.changeGridValues(0, 0, cubit.PLAYER_TWO);
                         }
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
                        if(cubit.turn){
                          cubit.changeGridValues(0, 1, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(0, 1, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(0, 2, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(0, 2, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(1, 0, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(1, 0, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(1, 1, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(1, 1, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(1, 2, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(1, 2, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(2, 0, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(2, 0, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(2, 1, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(2, 1, cubit.PLAYER_TWO);
                        }
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
                        if(cubit.turn){
                          cubit.changeGridValues(2, 2, cubit.PLAYER_ONE);
                        }else{
                          cubit.changeGridValues(2, 2, cubit.PLAYER_TWO);
                        }
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
              ],
            )
          );
        }
    );
  }
}
