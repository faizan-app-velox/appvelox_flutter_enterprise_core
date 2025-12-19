import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/utils/failure_mapper.dart';
import '../../../../core/presentation/widgets/app_status_widget.dart';
import '../../../../core/presentation/widgets/custom_back_button.dart';
import '../../../../core/presentation/widgets/transaction_card.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../l10n/localization_extension.dart';
import '../bloc/transactions_cubit.dart';
import '../bloc/transactions_state.dart';
import '../widgets/transaction_skeleton.dart';

class AllTransactionsPage extends StatelessWidget {
  const AllTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TransactionsCubit>()..loadData(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: 70,
          leading: const Center(child: CustomBackButton()),
          title: Text(context.l10n.allTransactions),
          centerTitle: true,
        ),

        body: BlocBuilder<TransactionsCubit, TransactionsState>(
          builder: (context, state) {
            return state.when(
              // Initial state
              initial: () => const SizedBox.shrink(),

              // Loading state
              loading: () => const TransactionSkeleton(),

              // Error state
              error: (failure) => AppStatusWidget(
                message: failure.toMessage(context),
                icon: Icons.receipt_long_rounded,
                onRetry: () {
                  context.read<TransactionsCubit>().loadData();
                },
              ),

              // Success
              loaded: (transactions) {
                if (transactions.isEmpty) {
                  if (transactions.isEmpty) {
                    return AppStatusWidget(
                      title: context.l10n.noTransactions,
                      message: context.l10n.noTransactionsFound,
                      icon: Icons.receipt_long_rounded,
                      color: Colors.teal,
                      onRetry: () {
                        context.read<TransactionsCubit>().loadData();
                      },
                    );
                  }
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];

                    return TransactionCard(
                          transaction: transaction,
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.transactionDetail,
                              extra: transaction,
                            );
                          },
                        )
                        // Staggered animation
                        .animate(delay: (50 * index).ms)
                        .slideY(begin: 0.2, end: 0)
                        .fadeIn();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
