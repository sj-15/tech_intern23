import 'package:flutter/material.dart';
import 'package:rashoipedia/components/colors/color.dart';
import 'package:rashoipedia/screens/homepage_screen.dart';
import 'package:rashoipedia/screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: background,
      ),
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: LandingScreen.routeName,
    );
  }
}
