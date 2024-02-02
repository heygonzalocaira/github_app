import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltimeforce_challenge/l10n/l10n.dart';
import 'package:fulltimeforce_challenge/settings/cubit/settings_cubit.dart';

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
                        context.read<SettingsCubit>().changeTheme(value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.languageText,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: state.locale.languageCode ==
                          context.read<SettingsCubit>().english,
                      onChanged: (bool value) {
                        if (value) {
                          context.read<SettingsCubit>().changeLanguage(
                                context.read<SettingsCubit>().english,
                              );
                        } else {
                          context.read<SettingsCubit>().changeLanguage(
                                context.read<SettingsCubit>().spanish,
                              );
                        }
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
