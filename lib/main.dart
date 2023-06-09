import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/providers/days_provider.dart';
import 'package:weather_app2/providers/today_provider.dart';
import 'package:weather_app2/screens/home_screen.dart';

void main() {
  runApp(const StateApp());
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DaysProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodayProvider(),
        ),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
