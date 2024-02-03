import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltimeforce_challenge/l10n/l10n.dart';
import 'package:fulltimeforce_challenge/router/router.dart';
import 'package:fulltimeforce_challenge/settings/cubit/settings_cubit.dart';
import 'package:fulltimeforce_challenge/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GithubRepository(),
        ),
        RepositoryProvider(
          create: (context) => SharedPreferencesRepository(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
        sharedPreferencesRepository:
            context.read<SharedPreferencesRepository>(),
      )..init(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.isDark ? AppTheme.standardDark : AppTheme.standard,
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
