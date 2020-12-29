import 'package:flutter/material.dart';
import 'package:imc_app/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffA1D4EB),
        accentColor:  Color(0xff424142),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xff424142)
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(
            color: Color(0xff424142)
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(20)
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              ),
              borderSide: BorderSide(color: Color(0xffA1D4EB))
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              ),
              borderSide: BorderSide(color: Color(0xff424142))
          ),
        )
      ),
      home: HomeScreen(),
    );
  }
}
