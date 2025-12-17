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

import 'core/common/cubits/language_cubit.dart' as _i263;
import 'core/common/cubits/theme_cubit.dart' as _i90;
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i448;
import 'features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i557;
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart' as _i521;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i263.LanguageCubit>(() => _i263.LanguageCubit());
    gh.lazySingleton<_i90.ThemeCubit>(() => _i90.ThemeCubit());
    gh.lazySingleton<_i557.DashboardRepository>(
      () => _i448.DashboardRepositoryImpl(),
    );
    gh.factory<_i521.DashboardBloc>(
      () => _i521.DashboardBloc(repository: gh<_i557.DashboardRepository>()),
    );
    return this;
  }
}
