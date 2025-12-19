import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/utils/mock_transaction_generator.dart';
import '../../../../core/domain/entities/transaction_entity.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/transaction_repository.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<Either<Failure, List<TransactionEntity>>> getAllTransactions() async {
    try {
      // Simulating network call
      await Future.delayed(const Duration(milliseconds: 2000));

      // Return dummy data
      final data = MockTransactionGenerator.generateList(count: 20);

      return Right(data);
    } catch (e) {
      if (e is SocketException) {
        return Left(NoInternetFailure());
      }
      return Left(SomeErrorFailure());
    }
  }
}
