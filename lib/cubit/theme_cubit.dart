import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeMode { light, dark }

class ThemesCubit extends Cubit<ThemeData> {
  ThemesCubit() : super(ThemeData.light()) {
    _getThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs({required ThemeMode themeMode}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(
        'theme', themeMode == ThemeMode.light ? 0 : 1);
  }

  Future<void> _getThemeFromPrefs() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedThemeIndex = sharedPreferences.getInt('theme') ?? 0;
    final savedTheme =
        savedThemeIndex == 0 ? ThemeData.light() : ThemeData.dark();
    emit(savedTheme);
  }

  void toggleTheme() {
    final newTheme =
        state == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    emit(newTheme);
    _saveThemeToPrefs(
        themeMode:
            newTheme == ThemeData.light() ? ThemeMode.light : ThemeMode.dark);
  }
}
