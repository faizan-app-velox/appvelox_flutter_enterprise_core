import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/transaction_type.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions() async {
    // SIMULATING NETWORK DELAY
    await Future.delayed(const Duration(seconds: 2));

    try {
      // SIMULATING DATABASE
      final List<TransactionEntity> transactions = List.generate(20, (index) {
        final amount = (index + 1) * 2500.0;

        return TransactionEntity(
          id: 100 + index,
          amount: amount,
          date: "Dec ${10 + index}",
          // LOGIC: Every 3rd item is an expense
          type: (index % 3 != 0)
              ? TransactionType.income
              : TransactionType.expense,
        );
      });

      return Right(transactions);
    } catch (e) {
      if (e is SocketException) {
        return Left(NoInternetFailure());
      }
      return Left(SomeErrorFailure());
    }
  }
}
