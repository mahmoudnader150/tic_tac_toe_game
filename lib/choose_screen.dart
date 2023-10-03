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
          var playerX = TextEditingController();
          var playerO = TextEditingController();
          var formKey = GlobalKey<FormState>();
          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Scaffold(
            key: scaffoldKey,
             backgroundColor: HexColor("#050A30") ,
             appBar: AppBar(
               leading: IconButton(
                 onPressed: (){
                   navigateAndFinish(context, StartScreen());
                 },
                 icon: Icon(Icons.arrow_back_ios),
               ),
               backgroundColor: HexColor("#050A30"),
               elevation: 0.0,),
             body: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Form(
                 key: formKey,
                   child: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please enter your names: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 20,),
                        defaultFormField(
                              controller: playerX,
                              type: TextInputType.text,
                              validate: (value){
                                if(value!.isEmpty){return "Please enter your name";}
                                return null;
                              },
                              label: "PlayerX",
                              prefix: Icons.title_sharp
                          ),
                          SizedBox(height: 20,),
                          defaultFormField(
                            controller: playerO,
                            type: TextInputType.text,
                            validate: (value){
                              if(value!.isEmpty){return "Please enter your name";}
                              return null;
                            },
                            label: "PlayerO",
                            prefix: Icons.title_sharp
                        ),
                        SizedBox(height: 25,),
                        MaterialButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              cubit.PLAYER_ONE_NAME = playerX.text;
                              cubit.PLAYER_TWO_NAME = playerO.text;
                               navigateAndFinish(context, GameScreen());
                            }
                          },
                          color:  Colors.purpleAccent,
                          child: Text(
                            "START",
                            style: TextStyle(
                              color:Colors.white,
                            ),
                          ),
                        )
                      ],
               ),
                   ),
                 ),
             ),
           );
        },
     );
  }
}
