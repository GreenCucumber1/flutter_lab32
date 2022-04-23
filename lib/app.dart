import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplov_lab2/bloc/bloc.dart';
import 'my_home_page1.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (_) => CharactersBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
      )
    );
  }
}