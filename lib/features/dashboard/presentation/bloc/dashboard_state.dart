import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/transaction_entity.dart';
import '../../../../core/error/failure.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

  const factory DashboardState.loading() = _Loading;

  const factory DashboardState.loaded({
    required List<TransactionEntity> transactions,
    required double totalRevenue,
    required List<double> chartData,
  }) = _Loaded;

  const factory DashboardState.error(Failure failure) = _Error;
}
