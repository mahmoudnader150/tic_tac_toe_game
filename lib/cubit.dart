import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/states.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() :super(GameInitialState());
  static GameCubit get(context) => BlocProvider.of(context);

  List<List<int>> grid=[
    [0,0,0],
    [0,0,0],
    [0,0,0]
  ];

  int PLAYER_ONE = 1;
  int PLAYER_TWO = 2;





}