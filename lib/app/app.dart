import 'package:avanced_course/presentation/resources/routes_manager.dart';
import 'package:avanced_course/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key); // default constructor

  // named constructor
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); // singleton or single instance

  // the factory is the thing that return the instance to me
  factory MyApp()=> _instance ;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
