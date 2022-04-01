import 'package:etf_calculator/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage();

  static const String page = 'calculator_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tabContents = [
      CalculatorGraphPage(),
      CalculatorTablePage(),
    ];

    return DefaultTabController(
      length: tabContents.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('etf calculator'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'graph'),
              Tab(text: 'table'),
            ],
          ),
        ),
        body: const TabBarView(
          children: tabContents,
        ),
      ),
    );
  }
}
