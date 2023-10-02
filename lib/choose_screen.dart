import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/components.dart';
import 'package:tic_tac_toe/cubit.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/start_screen.dart';
import 'package:tic_tac_toe/states.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return  BlocConsumer<GameCubit,GameStates>(
         listener: (context,state){},
         builder: (context,state){
          var cubit =  GameCubit.get(context);
          return Scaffold(
             backgroundColor: HexColor("#050A30"),
             appBar: AppBar(
               leading: IconButton(
                 onPressed: (){
                   navigateAndFinish(context, StartScreen());
                 },
                 icon: Icon(Icons.arrow_back_ios),
               ),
               backgroundColor: HexColor("#050A30"),
               elevation: 0.0,),
             body: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   "Player One Choose X or O :",
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                       fontSize: 25
                   ),
                 ),
                 SizedBox(height: 20,),
                 Center(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InkWell(
                         onTap: (){
                           cubit.PLAYER_ONE = 1;
                           cubit.PLAYER_TWO = 2;
                           navigateTo(context, GameScreen());
                         },
                         child: Container(
                           height: 100,
                           width: 100,
                           child:Center(
                             child: Text("X",
                               style:TextStyle(
                                   color: Colors.red,
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
                           cubit.PLAYER_ONE = 2;
                           cubit.PLAYER_TWO = 1;
                           navigateTo(context, GameScreen());
                         },
                         child: Container(
                           height: 100,
                           width: 100,
                           child:Center(
                             child: Text("O",
                               style:TextStyle(
                                   color: Colors.orange,
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
                 )
               ],
             ),
           );
        },
     );
  }
}
