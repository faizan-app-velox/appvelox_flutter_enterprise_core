import 'package:appvelox_flutter_enterprise_core/core/domain/entities/transaction_type.dart';
import 'package:appvelox_flutter_enterprise_core/core/error/failure.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:appvelox_flutter_enterprise_core/core/domain/entities/transaction_entity.dart';

// Create a Mock Repository
class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late DashboardCubit cubit;
  late MockDashboardRepository mockDashboardRepository;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    // Inject the Mock Repository into the Bloc
    cubit = DashboardCubit(mockDashboardRepository);
  });

  // Define Test Data
  final tTransactions = [
    const TransactionEntity(
      id: 1,
      amount: 100.0,
      date: "Dec 12",
      type: TransactionType.income, // This should be Summed
    ),
    const TransactionEntity(
      id: 2,
      amount: 50.0,
      date: "Dec 12",
      type: TransactionType.expense, // This should be Ignored in Revenue
    ),
  ];

  group('DashboardBloc', () {
    test('initial state should be DashboardState.initial', () {
      expect(cubit.state, const DashboardState.initial());
    });

    // TEST CASE: SUCCESS
    blocTest<DashboardCubit, DashboardState>(
      'emits [DashboardState.loading, DashboardState.loaded] when data is found successfully',
      build: () {
        when(
          () => mockDashboardRepository.getTransactions(),
        ).thenAnswer((_) async => Right(tTransactions));
        return cubit;
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        const DashboardState.loading(),
        DashboardState.loaded(
          transactions: tTransactions,
          totalRevenue: 100.0,
          chartData: const [
            3000.0,
            5000.0,
            4000.0,
            7000.0,
            5000.0,
            8000.0,
            6000.0,
          ],
        ),
      ],
      verify: (_) {
        verify(() => mockDashboardRepository.getTransactions()).called(1);
      },
    );

    // TEST CASE: FAILURE
    blocTest<DashboardCubit, DashboardState>(
      'emits [DashboardState.loading, DashboardState.error] when getting data fails',
      build: () {
        when(
          () => mockDashboardRepository.getTransactions(),
        ).thenAnswer((_) async => Left(SomeErrorFailure()));
        return cubit;
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        const DashboardState.loading(),
        DashboardState.error(SomeErrorFailure()),
      ],
    );
  });
}
