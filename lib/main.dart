import 'package:flutter/material.dart';
import 'package:myapp/profile_display.dart';
//https://www.youtube.com/watch?v=jbOgULYBxyc&t=359s
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
   debugShowCheckedModeBanner: false,
      home: GetMethodWithoutModel(),
    );
  }
}
