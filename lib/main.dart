import 'core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/theme/app_theme.dart';
import 'core/common/cubits/theme_cubit.dart';
import 'core/common/cubits/language_cubit.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'injection.dart' as di;
import 'injection.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageDirectory = HydratedStorageDirectory(
    (await getApplicationDocumentsDirectory()).path,
  );

  // Initialize Hydrated Bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: storageDirectory,
  );

  // Initialize Dependencies (GetIt)
  initializeDependencies();

  runApp(const AppVeloxCore());
}

class AppVeloxCore extends StatelessWidget {
  const AppVeloxCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ThemeCubit>()),
        BlocProvider(create: (_) => di.sl<LanguageCubit>()),
        BlocProvider(create: (_) => di.sl<DashboardBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                title: 'AppVelox Core',
                debugShowCheckedModeBanner: false,
                // Connect GoRouter
                routerConfig: appRouter,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                locale: locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                //home: const DashboardPage(),
              );
            },
          );
        },
      ),
    );
  }
}
