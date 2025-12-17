import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_back_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../l10n/localization_extension.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';
import '../widgets/transaction_card.dart';

class AllTransactionsPage extends StatelessWidget {
  const AllTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 70,
        leading: const Center(child: CustomBackButton()),
        title: Text(context.l10n.allTransactions),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 20,
        itemBuilder: (context, index) {
          final isIncome = index % 3 != 0;

          final transaction = TransactionEntity(
            id: 200 + index,
            amount: (index + 1) * 2500.0,
            date: "Dec ${10 + index}, 2025",
            type: isIncome ? TransactionType.income : TransactionType.expense,
          );

          return TransactionCard(
            transaction: transaction,
            onTap: () {
              context.pushNamed(
                AppRoutes.transactionDetail,
                extra: transaction,
              );
            },
          ).animate(delay: (50 * index).ms).slideY(begin: 0.2, end: 0).fadeIn();
        },
      ),
    );
  }
}
