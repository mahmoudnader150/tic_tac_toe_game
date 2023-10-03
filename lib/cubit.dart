import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/states.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() :super(GameInitialState());
  static GameCubit get(context) => BlocProvider.of(context);

  List<List<int>> valuesGrid=[
    [0,0,0],
    [0,0,0],
    [0,0,0]
  ];
  List<List<String>> lettersGrid=[
    ["","",""],
    ["","",""],
    ["","",""],
  ];

  List<List<Color>> colorsGrid=[
    [Colors.purple,Colors.purple,Colors.purple,],
    [Colors.purple,Colors.purple,Colors.purple,],
    [Colors.purple,Colors.purple,Colors.purple,],
  ];


  int PLAYER_ONE = 1;
  int PLAYER_TWO = 2;
  String PLAYER_ONE_NAME = "Player X";
  String PLAYER_TWO_NAME = "Player O";

  int WINNER = 0;

  bool turn = true;

  void changeGridValues(int row,int column,int value){
    if(valuesGrid[row][column]==0){
      if(value==1){
        valuesGrid[row][column] = value;
        colorsGrid[row][column] = Colors.red;
        lettersGrid[row][column] = "X";
        emit(ChangeGridGameState());
        changeTurn();
      }else if(value==2){
        valuesGrid[row][column] = value;
        colorsGrid[row][column] = Colors.orange;
        lettersGrid[row][column] = "O";
        emit(ChangeGridGameState());
        changeTurn();
      }
    }else{
      emit(ErrorChangGridGameState());
    }
  }


  void clearGame(){
    WINNER = 0;
    turn = true;
    for(int i=0;i<3;i++)
        for(int j=0;j<3;j++){
          valuesGrid[i][j] = 0;
          colorsGrid[i][j] = Colors.purple;
          lettersGrid[i][j] = "";
        }
    emit(ClearGridGameState());
  }


  void checkWinner(){
    print(valuesGrid);
    //Check for rows
    for (int i=0;i<3;i++){
      if(valuesGrid[i][0]==valuesGrid[i][1]&&valuesGrid[i][1]==valuesGrid[i][2] && valuesGrid[i][2] !=0){
         WINNER = valuesGrid[i][0];
         emit(RowWinnerGameState());
         return;
      }
    }
    //Check for cols
    for (int i=0;i<3;i++){
      if(valuesGrid[0][i]==valuesGrid[1][i]&&valuesGrid[1][i]==valuesGrid[2][i]&& valuesGrid[2][i] !=0){
        WINNER = valuesGrid[0][i];
        emit(ColumnWinnerGameState());
        return;
      }
    }
    //check diagonals
    if(valuesGrid[0][0]==valuesGrid[1][1] && valuesGrid[1][1]==valuesGrid[2][2]&& valuesGrid[2][2] !=0){
      WINNER = valuesGrid[0][0];
      emit(DiagonalWinnerGameState());
      return;
    }
    if(valuesGrid[0][2]==valuesGrid[1][1] && valuesGrid[1][1]==valuesGrid[2][0]&& valuesGrid[2][0] !=0){
      WINNER = valuesGrid[1][1];
      emit(DiagonalWinnerGameState());
      return;
    }
    checkDraw();
  }
  bool checkDraw(){
    for (int i=0;i<3;i++){
      for (int j=0;j<3;j++){
        if(valuesGrid[i][j]==0)return false;
      }
    }
    emit(DrawGameState());
    return true;
  }
  void changeTurn(){
    turn = !turn;
    emit(ChangeTurnGameState());
  }
  String gameMessage(){
    if( WINNER==1) return "${PLAYER_ONE_NAME} Wins!";
    else if(WINNER==2) return "${PLAYER_TWO_NAME} Wins!";
    if(checkDraw())return "DRAW!";
    return "";
  }
}