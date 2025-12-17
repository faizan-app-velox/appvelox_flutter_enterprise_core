import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_type.dart';

part 'transaction_entity.freezed.dart';

@freezed
abstract class TransactionEntity with _$TransactionEntity {
  const TransactionEntity._();

  const factory TransactionEntity({
    required int id,
    required double amount,
    required String date,
    required TransactionType type,
  }) = _TransactionEntity;
}
