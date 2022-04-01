import 'package:etf_calculator/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorTablePage extends ConsumerWidget {
  const CalculatorTablePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(calculatorProvider);

    return result.when(
      data: (data) {
        return SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('year')),
              DataColumn(label: Text('amount')),
              DataColumn(label: Text('total paid')),
              DataColumn(label: Text('returns')),
            ],
            rows: data.series.entries
                .map<DataRow>(
                  (entry) => DataRow(
                    cells: [
                      DataCell(Text('${entry.key}')),
                      DataCell(Text('${entry.value.totalAmount.ceil()}')),
                      DataCell(Text('${entry.value.totalPaidAmount.ceil()}')),
                      DataCell(Text('${entry.value.returns.ceil()}')),
                    ],
                  ),
                )
                .toList(),
          ),
        );
      },
      error: (_, __) => const Center(
        child: Text('error :('),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
