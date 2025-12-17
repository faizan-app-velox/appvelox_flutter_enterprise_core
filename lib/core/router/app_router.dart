import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';
import '../../features/dashboard/domain/entities/transaction_entity.dart';
import '../../features/dashboard/presentation/pages/all_transactions_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dashboard/presentation/pages/transaction_detail_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.dashboardPath,
  routes: [
    GoRoute(
      path: AppRoutes.dashboardPath,
      name: AppRoutes.dashboard,
      builder: (context, state) => const DashboardPage(),
      routes: [
        // Nested navigation for maintaining back stack.
        GoRoute(
          path: AppRoutes.allTransactionsPath,
          name: AppRoutes.allTransactions,
          builder: (context, state) => const AllTransactionsPage(),
        ),
        GoRoute(
          path: AppRoutes.transactionDetailPath,
          name: AppRoutes.transactionDetail,
          builder: (context, state) {
            final transaction = state.extra as TransactionEntity?;
            if (transaction == null) return const DashboardPage();
            return TransactionDetailPage(transaction: transaction);
          },
        ),
      ],
    ),
  ],
);
