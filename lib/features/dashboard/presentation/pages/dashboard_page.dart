import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/cubits/theme_cubit.dart';
import '../../../../core/presentation/cubits/language_cubit.dart';
import '../../../../core/presentation/utils/failure_mapper.dart';
import '../../../../core/presentation/widgets/app_status_widget.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../l10n/localization_extension.dart';
import '../../../../core/presentation/widgets/transaction_card.dart';

import '../bloc/dashboard_cubit.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/dashboard_skeleton.dart';
import '../widgets/dashboard_stats_widget.dart';
import '../widgets/section_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardCubit>()..loadData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () => context.read<LanguageCubit>().toggleLanguage(),
            ),
            IconButton(
              icon: Icon(
                context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            ),
          ],
        ),

        // 2. Consume the Cubit
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return state.when(
              // Initial state
              initial: () => const SizedBox.shrink(),

              // Loading state
              loading: () => const DashboardSkeleton(),

              // Error state
              error: (failure) => AppStatusWidget(
                message: failure.toMessage(context),
                onRetry: () => context.read<DashboardCubit>().loadData(),
              ),

              // Loaded state
              loaded: (transactions, totalRevenue, chartData) {
                return RefreshIndicator(
                  onRefresh: () async =>
                      context.read<DashboardCubit>().loadData(),
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      // Stats Widget
                      DashboardStatsWidget(
                        totalRevenue: totalRevenue,
                        chartData: chartData,
                      ),

                      const SizedBox(height: 30),

                      // Section Header
                      SectionHeader(
                        title: context.l10n.recentTransactions,
                        actionText: context.l10n.seeAll,
                        onAction: () =>
                            context.pushNamed(AppRoutes.allTransactions),
                      ),

                      const SizedBox(height: 15),

                      // Transactions List Logic
                      if (transactions.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: AppStatusWidget(
                            title: context.l10n.noTransactions,
                            message: context.l10n.noTransactionsFound,
                            icon: Icons.receipt_long_rounded,
                            color: Colors.teal,
                            onRetry: () =>
                                context.read<DashboardCubit>().loadData(),
                          ),
                        )
                      else
                        ...transactions.map((transaction) {
                          return TransactionCard(
                            transaction: transaction,
                            onTap: () => context.pushNamed(
                              AppRoutes.transactionDetail,
                              extra: transaction,
                            ),
                          ).animate().fadeIn().slideY(begin: 0.1, end: 0);
                        }),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
