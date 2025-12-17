import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/cubits/theme_cubit.dart';
import '../../../../core/common/cubits/language_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../l10n/localization_extension.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/dashboard_skeleton.dart';
import '../widgets/dashboard_stats_widget.dart';
import '../widgets/section_header.dart';
import '../widgets/transaction_card.dart';
import '../widgets/dashboard_error_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger dashboard data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<DashboardBloc>().state is! DashboardLoaded) {
        context.read<DashboardBloc>().add(LoadDashboardData());
      }
    });

    return Scaffold(
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
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const DashboardSkeleton();
          } else if (state is DashboardError) {
            return DashboardErrorWidget(
              message: mapFailureToMessage(context, state.failure),
              onRetry: () =>
                  context.read<DashboardBloc>().add(LoadDashboardData()),
            );
          } else if (state is DashboardLoaded) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<DashboardBloc>().add(LoadDashboardData()),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  // Stats Widget
                  DashboardStatsWidget(
                    totalRevenue: state.totalRevenue,
                    chartData: state.chartData,
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

                  // Transactions List
                  ...state.transactions.take(5).map((transaction) {
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
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  String mapFailureToMessage(BuildContext context, Failure failure) {
    if (failure is NoInternetFailure) {
      return context.l10n.noInternetConnection;
    } else if (failure is SomeErrorFailure) {
      return context.l10n.thereIsSomeProblem;
    }
    return context.l10n.thereIsSomeProblem;
  }
}
