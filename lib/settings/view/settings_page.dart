import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltimeforce_challenge/l10n/l10n.dart';
import 'package:fulltimeforce_challenge/settings/cubit/settings_cubit.dart';
import 'package:fulltimeforce_challenge/settings/setttings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.themeText,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: state.isDark,
                      onChanged: (bool value) {
                        context
                            .read<SettingsCubit>()
                            .changeTheme(isDark: value);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.3),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.languageText,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LanguageStatusWidget(
                      language: context.read<SettingsCubit>().spanish,
                      currentLanguage: context
                          .read<SettingsCubit>()
                          .state
                          .locale
                          .languageCode,
                      label: l10n.spanishText,
                      onPressed: () {
                        context.read<SettingsCubit>().changeLanguage(
                              data: context.read<SettingsCubit>().spanish,
                            );
                      },
                    ),
                    const SizedBox(height: 16),
                    LanguageStatusWidget(
                      language: context.read<SettingsCubit>().english,
                      currentLanguage: context
                          .read<SettingsCubit>()
                          .state
                          .locale
                          .languageCode,
                      label: l10n.englishText,
                      onPressed: () {
                        context.read<SettingsCubit>().changeLanguage(
                              data: context.read<SettingsCubit>().english,
                            );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
