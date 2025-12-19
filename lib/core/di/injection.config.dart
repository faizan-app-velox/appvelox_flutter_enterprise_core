// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i509;
import '../../features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i665;
import '../../features/dashboard/presentation/bloc/dashboard_cubit.dart'
    as _i58;
import '../../features/transactions/data/repositories/transaction_repository_impl.dart'
    as _i443;
import '../../features/transactions/domain/repositories/transaction_repository.dart'
    as _i421;
import '../../features/transactions/presentation/bloc/transactions_cubit.dart'
    as _i381;
import '../presentation/cubits/language_cubit.dart' as _i218;
import '../presentation/cubits/theme_cubit.dart' as _i203;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i218.LanguageCubit>(() => _i218.LanguageCubit());
    gh.lazySingleton<_i203.ThemeCubit>(() => _i203.ThemeCubit());
    gh.lazySingleton<_i665.DashboardRepository>(
      () => _i509.DashboardRepositoryImpl(),
    );
    gh.factory<_i58.DashboardCubit>(
      () => _i58.DashboardCubit(gh<_i665.DashboardRepository>()),
    );
    gh.lazySingleton<_i421.TransactionRepository>(
      () => _i443.TransactionRepositoryImpl(),
    );
    gh.factory<_i381.TransactionsCubit>(
      () => _i381.TransactionsCubit(gh<_i421.TransactionRepository>()),
    );
    return this;
  }
}
