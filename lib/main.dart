import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubit.dart';
import 'package:tic_tac_toe/start_screen.dart';
import 'package:tic_tac_toe/states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers:[
        BlocProvider(
            create: (context)=>GameCubit()
        )
      ],
      child: BlocConsumer<GameCubit,GameStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  StartScreen(),
          );
        },
      ),
    );
  }
}


