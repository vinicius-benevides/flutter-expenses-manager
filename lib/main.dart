import 'package:expenses_manager/pages/home.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despesas Pessoais',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 52, 119, 55),
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
        ),
        colorScheme: ColorScheme.fromSeed(
          primary: Color.fromARGB(255, 66, 151, 70),
          seedColor: Color.fromARGB(255, 66, 151, 70),
        ),
      ),
    );
  }
}
