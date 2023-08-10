import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Detail/detail_screen.dart';
import 'package:news_app/news_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.battambangTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/news',
        routes: {
          '/news': (context) => NewsApp(),
          '/detail': (context) => const DetailScreen(),
        });
  }
}
