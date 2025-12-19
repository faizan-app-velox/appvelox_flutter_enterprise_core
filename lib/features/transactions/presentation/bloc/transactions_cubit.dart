import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/transaction_repository.dart';
import 'transactions_state.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionRepository _repo;

  TransactionsCubit(this._repo) : super(const TransactionsState.initial());

  Future<void> loadData() async {
    emit(const TransactionsState.loading());
    final result = await _repo.getAllTransactions();
    result.fold(
      (failure) => emit(TransactionsState.error(failure)),
      (transactions) => emit(TransactionsState.loaded(transactions)),
    );
  }
}
