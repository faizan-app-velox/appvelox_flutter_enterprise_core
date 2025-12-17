import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/common/widgets/custom_back_button.dart';
import '../../../../l10n/localization_extension.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/receipt_card.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionEntity transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 70,
        leading: const Center(child: CustomBackButton()),
        title: Text(context.l10n.details),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 10),

            ReceiptCard(transaction: transaction),

            const SizedBox(height: 30),

            // Share Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  final isIncome = transaction.type == TransactionType.income;
                  final sign = isIncome ? '+' : '-';
                  final formattedAmount =
                      '$sign\$${transaction.amount.toStringAsFixed(2)}';
                  SharePlus.instance.share(
                    ShareParams(
                      text: context.l10n.shareTransactionText(
                        formattedAmount,
                        context.l10n.statusCompleted,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.adaptive.share_rounded),
                label: Text(context.l10n.shareReceipt),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.brandTeal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5, end: 0),
          ],
        ),
      ),
    );
  }
}
