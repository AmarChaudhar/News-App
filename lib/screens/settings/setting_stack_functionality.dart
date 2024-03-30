import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/screens/settings/setting_stack_desing.dart';

class SettingsStackFunctionality extends StatelessWidget {
  final bool showSettings;
  final VoidCallback onTap;

  const SettingsStackFunctionality({
    super.key,
    required this.showSettings,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print('settings functionss');
    return Stack(
      children: [
        // Positioned(child: HomeScreen()),
        if (showSettings)
          Positioned.fill(
            child: GestureDetector(
              onTap: onTap,
              child: BlocBuilder<ThemesCubit, ThemeData>(
                builder: (context, state) {
                  final mainContainerColor =
                      _getMainContainerColor(context, state);

                  final isDarkTheme =
                      mainContainerColor == ThemeData.dark().primaryColor;
                  return SettingsStackDesign(
                    mainContainerColor: mainContainerColor,
                    isDarkTheme: isDarkTheme,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Color _getMainContainerColor(BuildContext context, ThemeData state) {
    return state == ThemeData.light()
        ? Colors.white
        : ThemeData.dark().scaffoldBackgroundColor;
  }
}
