import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather/provider/Search_Provider.dart';
import 'package:wather/provider/Theme_Provider.dart';
import 'package:wather/view/HomePage.dart';
import 'package:wather/view/Spash_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(lightTheme)),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        '/': (context) => SplashScreen(),
        'Home': (context) => HomePage(),
      },
    );
  }
}
