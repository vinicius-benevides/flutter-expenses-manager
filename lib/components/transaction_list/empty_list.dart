import 'dart:math';

import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          spacing: constraints.maxHeight * 0.05,
          children: [
            Text(
              'Nenhuma transação cadastrada!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
              height: min(constraints.maxHeight * 0.6, 200),
            ),
          ],
        );
      },
    );
  }
}
