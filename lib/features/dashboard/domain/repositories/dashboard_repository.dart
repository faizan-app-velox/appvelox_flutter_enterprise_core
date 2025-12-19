import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/domain/entities/transaction_entity.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<TransactionEntity>>> getTransactions();
}
