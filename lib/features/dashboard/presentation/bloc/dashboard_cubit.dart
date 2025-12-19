import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/entities/transaction_type.dart';
import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository;

  DashboardCubit(this._repository) : super(const DashboardState.initial());

  Future<void> loadData() async {
    emit(const DashboardState.loading());

    final result = await _repository.getTransactions();

    result.fold((failure) => emit(DashboardState.error(failure)), (
      transactions,
    ) {
      // Calculate Revenue
      final totalRevenue = transactions
          .where((e) => e.type == TransactionType.income)
          .fold(0.0, (sum, item) => sum + item.amount);

      // Generate Chart Data (Keeping your dummy logic for now)
      final chartData = [3000.0, 5000.0, 4000.0, 7000.0, 5000.0, 8000.0, 6000.0];

      // Emit Loaded State
      emit(
        DashboardState.loaded(
          transactions: transactions,
          totalRevenue: totalRevenue,
          chartData: chartData,
        ),
      );
    });
  }
}
