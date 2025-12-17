import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../l10n/localization_extension.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';
import '../../../../core/theme/app_theme.dart';

class ReceiptCard extends StatelessWidget {
  final TransactionEntity transaction;

  const ReceiptCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final isIncome = transaction.type == TransactionType.income;
    final statusColor = isIncome ? AppTheme.brandTeal : const Color(0xFFEF4444);
    final statusIcon = isIncome
        ? Icons.check_rounded
        : Icons.arrow_outward_rounded;
    final statusText = isIncome
        ? context.l10n.transferSuccessful
        : context.l10n.paymentSent;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Hero Icon
          Hero(
            tag: 'icon_${transaction.id}',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(statusIcon, color: statusColor, size: 40),
            ),
          ),
          const SizedBox(height: 24),

          // Status Text
          Text(
            statusText,
            style: textTheme.bodyMedium?.copyWith(fontSize: 16),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 8),

          // Hero Amount
          Hero(
            tag: 'amount_${transaction.id}',
            child: Material(
              color: Colors.transparent,
              child: Text(
                "${isIncome ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}",
                style: textTheme.headlineMedium?.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                  color: textTheme.headlineMedium?.color,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 20),

          // Details Rows
          _buildDetailRow(
            context,
            "Type",
            isIncome
                ? context.l10n.paymentReceived
                : context.l10n.subscriptionCost,
            delay: 400,
          ),
          _buildDetailRow(
            context,
            "Category",
            isIncome ? context.l10n.archService : context.l10n.softLicense,
            delay: 450,
          ),
          _buildDetailRow(context, "Date", transaction.date, delay: 500),
          _buildDetailRow(
            context,
            "Reference",
            "#AVLX-${9900 + transaction.id}",
            delay: 600,
          ),
          // Status Row
          _buildDetailRow(
            context,
            "Status",
            context.l10n.statusCompleted,
            delay: 700,
            valueColor: statusColor,
            isBold: true,
          ),
        ],
      ),
    ).animate().slideY(begin: 0.1, end: 0, duration: 600.ms).fadeIn();
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    required int delay,
    Color? valueColor,
    bool isBold = false,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.bodyMedium?.copyWith(fontSize: 15)),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: isBold
                  ? textTheme.titleLarge?.copyWith(
                      fontSize: 15,
                      color: valueColor,
                    )
                  : textTheme.bodyLarge?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: valueColor,
                    ),
            ),
          ),
        ],
      ),
    ).animate(delay: delay.ms).fadeIn().slideX(begin: 0.1, end: 0);
  }
}
