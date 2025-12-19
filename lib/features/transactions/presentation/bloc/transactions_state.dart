import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/transaction_entity.dart';
import '../../../../core/error/failure.dart';

part 'transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial() = _Initial;

  const factory TransactionsState.loading() = _Loading;

  const factory TransactionsState.loaded(List<TransactionEntity> transactions) =
      _Loaded;

  const factory TransactionsState.error(Failure failure) = _Error;
}
