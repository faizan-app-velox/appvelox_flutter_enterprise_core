import 'package:dartz/dartz.dart';
import '../../../../core/domain/entities/transaction_entity.dart';
import '../../../../core/error/failure.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> getAllTransactions();
}
