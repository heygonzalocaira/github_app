import 'package:flutter/material.dart';
import 'package:fulltimeforce_challenge/utils/colors.dart';

/// Theme for challenge
class AppTheme {
  static ThemeData get standard {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.grey,
      colorScheme: _colorScheme,
      appBarTheme: _appBarTheme,
      switchTheme: _switchTheme,
      fontFamily: 'poppins',
    );
  }

  static ThemeData get standardDark {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: _colorSchemeDark,
      appBarTheme: _appBarTheme,
      switchTheme: _switchThemeDark,
      fontFamily: 'poppins',
    );
  }

  static ColorScheme get _colorScheme {
    return const ColorScheme(
      primary: AppColors.grey,
      secondary: AppColors.white,
      tertiary: AppColors.green,
      background: AppColors.softGrey,
      error: Colors.red,
      onPrimary: AppColors.grey,
      onSecondary: AppColors.yellow,
      surface: AppColors.green,
      onSurface: AppColors.black,
      onBackground: AppColors.grey,
      onError: Colors.red,
      brightness: Brightness.dark,
    );
  }

  static ColorScheme get _colorSchemeDark {
    return const ColorScheme(
      primary: AppColors.black,
      secondary: AppColors.darkGrey,
      tertiary: AppColors.green,
      background: AppColors.darkGrey,
      error: Colors.red,
      onPrimary: AppColors.semiBlack,
      onSecondary: AppColors.yellow,
      surface: AppColors.green,
      onSurface: AppColors.white,
      onBackground: AppColors.semiBlack,
      onError: Colors.red,
      brightness: Brightness.light,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      elevation: 3,
    );
  }

  static SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.green; // Color del switch activado
          }
          return AppColors.grey; // Color del switch desactivado
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.darkGrey
                .withOpacity(0.5); // Color de la pista del switch activado
          }
          return AppColors.darkGrey
              .withOpacity(0.3); // Color de la pista del switch desactivado
        },
      ),
    );
  }

  static SwitchThemeData get _switchThemeDark {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.green; // Color del switch activado
          }
          return AppColors.grey; // Color del switch desactivado
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.green
                .withOpacity(0.5); // Color de la pista del switch activado
          }
          return AppColors.green
              .withOpacity(0.3); // Color de la pista del switch desactivado
        },
      ),
    );
  }
}
