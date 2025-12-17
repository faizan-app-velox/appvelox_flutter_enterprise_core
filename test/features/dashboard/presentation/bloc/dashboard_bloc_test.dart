import 'package:appvelox_flutter_enterprise_core/core/error/failure.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/domain/entities/transaction_entity.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/domain/entities/transaction_type.dart';
import 'package:appvelox_flutter_enterprise_core/features/dashboard/presentation/bloc/dashboard_bloc.dart';

// Create a Mock UseCase (Not Repository)
class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late DashboardBloc bloc;
  late MockDashboardRepository mockDashboardRepository;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    // Inject the Mock UseCase into the Bloc
    bloc = DashboardBloc(repository: mockDashboardRepository);
  });

  // 2. Define Test Data (Using Enums)
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
    test('initial state should be DashboardLoading', () {
      expect(bloc.state, DashboardLoading());
    });

    // TEST CASE: SUCCESS
    blocTest<DashboardBloc, DashboardState>(
      'emits [DashboardLoading, DashboardLoaded] when data is found successfully',
      build: () {
        when(
          () => mockDashboardRepository.getTransactions(),
        ).thenAnswer((_) async => Right(tTransactions));
        return bloc;
      },
      act: (bloc) => bloc.add(LoadDashboardData()),
      expect: () => [
        DashboardLoading(),
        DashboardLoaded(
          transactions: tTransactions,
          totalRevenue: 100.0,
          chartData: const [3.0, 5.0, 4.0, 7.0, 5.0, 8.0, 6.0],
        ),
      ],
      verify: (_) {
        verify(() => mockDashboardRepository.getTransactions()).called(1);
      },
    );

    // TEST CASE: FAILURE
    blocTest<DashboardBloc, DashboardState>(
      'emits [DashboardLoading, DashboardError] when getting data fails',
      build: () {
        // Arrange: Return a Failure
        when(
          () => mockDashboardRepository.getTransactions(),
        ).thenAnswer((_) async => Left(NoInternetFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(LoadDashboardData()),
      expect: () => [DashboardLoading(), DashboardError(SomeErrorFailure())],
    );
  });
}
