import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50,
      children: [
        Text(
          'Nenhuma transação cadastrada!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Image.asset(
          'assets/images/waiting.png',
          fit: BoxFit.cover,
          height: 200,
        ),
      ],
    );
  }
}
