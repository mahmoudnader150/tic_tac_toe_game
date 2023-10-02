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
    turn = true;
    for(int i=0;i<3;i++)
        for(int j=0;j<3;j++){
          valuesGrid[i][j] = 0;
          colorsGrid[i][j] = Colors.purple;
          lettersGrid[i][j] = "";
        }
    emit(ClearGridGameState());
  }


  void changeTurn(){
    turn = !turn;
    emit(ChangeTurnGameState());
  }

}