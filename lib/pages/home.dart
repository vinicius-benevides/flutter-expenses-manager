import 'package:expenses_manager/components/chart/chart.dart';
import 'package:expenses_manager/components/transaction_form/transaction_form.dart';
import 'package:expenses_manager/components/transaction_list/transaction_list.dart';
import 'package:expenses_manager/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final uuid = Uuid();
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: uuid.v4(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  Widget _getIconButton(IconData icon, VoidCallback onPressed) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return GestureDetector(onTap: onPressed, child: Icon(icon));
    }
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    final actions = [
      if (isLandscape)
        _getIconButton(
          _showChart
              ? (isIOS ? CupertinoIcons.chart_bar : Icons.bar_chart)
              : (isIOS ? CupertinoIcons.list_bullet : Icons.list),
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),

      _getIconButton(
        isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];

    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    );

    final cupertinoNavBar = CupertinoNavigationBar(
      middle: const Text('Despesas Pessoais'),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: actions),
    );

    final availableHeight =
        mediaQuery.size.height -
        (isIOS
            ? cupertinoNavBar.preferredSize.height
            : appBar.preferredSize.height) -
        mediaQuery.padding.top;

    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_showChart || !isLandscape)
              SizedBox(
                height: availableHeight * (isLandscape ? 0.8 : 0.3),
                child: Chart(recentTransactions: _recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availableHeight * (isLandscape ? 0.9 : 0.7),
                child: TransactionList(
                  transactions: _transactions,
                  onDelete: _deleteTransaction,
                ),
              ),
          ],
        ),
      ),
    );

    return isIOS
        ? CupertinoPageScaffold(navigationBar: cupertinoNavBar, child: body)
        : Scaffold(
            appBar: appBar,
            body: body,
            floatingActionButton: FloatingActionButton(
              tooltip: 'Adicionar transação',
              child: const Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context),
            ),
          );
  }
}
