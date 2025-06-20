import 'dart:math';

import 'package:expenses_manager/components/chart.dart';
import 'package:expenses_manager/components/transaction_form.dart';
import 'package:expenses_manager/components/transaction_list.dart';
import 'package:expenses_manager/models/transaction.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.59,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de água',
      value: 1200000000.00,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 't4',
      title: 'Seguro do carro',
      value: 150.00,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
