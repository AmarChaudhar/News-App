import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Main file');
    return BlocProvider(
      create: (context) => ThemesCubit(),
      child: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
