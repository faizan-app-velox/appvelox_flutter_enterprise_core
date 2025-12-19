import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/data/utils/mock_transaction_generator.dart';
import '../../../../core/domain/entities/transaction_type.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/domain/entities/transaction_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));

    try {
      // Return dummy data
      final List<TransactionEntity> transactions = MockTransactionGenerator.generateList(count: 5);

      return Right(transactions);
    } catch (e) {
      if (e is SocketException) {
        return Left(NoInternetFailure());
      }
      return Left(SomeErrorFailure());
    }
  }
}
