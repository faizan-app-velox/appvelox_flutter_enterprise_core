import 'package:intl/intl.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';

class MockTransactionGenerator {
  static List<TransactionEntity> generateList({int count = 20}) {
    return List.generate(count, (index) {
      final DateTime date = DateTime.now().subtract(Duration(days: index));

      return TransactionEntity(
        id: index,
        amount: (index + 1) * 1500.0,
        date: DateFormat('MMM d, y').format(date),
        type: index % 2 == 0 ? TransactionType.income : TransactionType.expense,
      );
    });
  }
}
