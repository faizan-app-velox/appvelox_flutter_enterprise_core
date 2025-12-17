import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/transaction_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';

// Events
abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDashboardData extends DashboardEvent {}

// States
abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<TransactionEntity> transactions;
  final double totalRevenue;
  final List<double> chartData;

  DashboardLoaded({
    required this.transactions,
    required this.totalRevenue,
    required this.chartData,
  });

  @override
  List<Object> get props => [transactions, totalRevenue, chartData];
}

class DashboardError extends DashboardState {
  final Failure failure;

  DashboardError(this.failure);
}

// Bloc Logic
@Injectable()
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository repository;

  DashboardBloc({required this.repository}) : super(DashboardLoading()) {
    on<LoadDashboardData>((event, emit) async {
      emit(DashboardLoading());

      final result = await repository.getTransactions();

      result.fold((failure) => emit(DashboardError(failure)), (transactions) {
        // Calculate Revenue & Chart Data from the Entity List
        final totalRevenue = transactions
            .where((e) => e.type == TransactionType.income) // Check Enum
            .fold(0.0, (sum, item) => sum + item.amount);

        // Dummy chart data generation based on list length
        final chartData = [3.0, 5.0, 4.0, 7.0, 5.0, 8.0, 6.0];

        emit(
          DashboardLoaded(
            transactions: transactions,
            totalRevenue: totalRevenue,
            chartData: chartData,
          ),
        );
      });
    });
  }
}
