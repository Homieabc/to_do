import 'package:flutter/material.dart';
import 'package:to_do/config/theme/colors.dart';
import 'package:to_do/screens/to_do_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/init/',
      routes: {
        '/init/': (context) => const ToDoScreen(),
      },
    );
  }
}
