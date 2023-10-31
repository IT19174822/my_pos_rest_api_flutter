import 'package:flutter/material.dart';
import 'package:flutter_app_calculator1/screens/start_screen.dart';

void main(){
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: Color.fromARGB(255, 42, 51, 59)

        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 50, 58, 60)

      ),
      home: StartScreen(),
    );
  }
}
