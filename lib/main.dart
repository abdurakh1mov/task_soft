import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_soft/bloc/home_bloc.dart';
import 'package:task_soft/db/db_base.dart';
import 'package:task_soft/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbBase.ensureInitialized();
  runApp(BlocProvider<HomeBloc>(
    create: (context) => HomeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task soft',
      home: MainScreen(),
    );
  }
}
