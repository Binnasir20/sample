import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();
  static const _primaryColorLight = Colors.black;
  static const _primaryColorDark = Colors.white;
  static const _switchActive = Colors.grey;
  static const _switchActiveColorDark = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primaryColorLight,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: _primaryColorLight
      ),
      switchTheme: SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(_switchActive),
          trackOutlineColor: WidgetStatePropertyAll(_switchActive)
      )
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: _primaryColorDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColorDark,
      ),
      switchTheme: SwitchThemeData(
          thumbColor:
          WidgetStatePropertyAll(_switchActiveColorDark),
          trackOutlineColor:
          WidgetStatePropertyAll(_switchActiveColorDark)
      )
  );
}