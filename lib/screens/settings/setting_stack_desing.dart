import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/screens/settings/feedback_dialog.dart';
// import 'package:news_app/screens/settings/feedback_dialog.dart';
import 'package:news_app/utils/media_query.dart';
// import 'package:news_app/utils/media_query_utils.dart';

class SettingsStackDesign extends StatelessWidget {
  final Color mainContainerColor;
  final bool isDarkTheme;

  const SettingsStackDesign({
    required this.mainContainerColor,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.0),
      child: Center(
        child: Container(
          width: MediaQueryUtils.getWidth(context, 0.9),
          height: MediaQueryUtils.getHeight(context, 0.5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueGrey,
              width: 2.7,
            ),
            borderRadius: BorderRadius.circular(20.0),
            color: mainContainerColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'App Theme',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: MediaQueryUtils.getWidth(context, 0.88),
                height: MediaQueryUtils.getHeight(context, 0.077),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2.1,
                  ),
                  borderRadius: BorderRadius.circular(22.0),
                  color: mainContainerColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Light Theme',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                          value: !isDarkTheme,
                          onChanged: (_) {
                            if (isDarkTheme) {
                              context.read<ThemesCubit>().toggleTheme();
                            }
                          }),
                      const Text(
                        'Dark Theme',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                        value: isDarkTheme,
                        onChanged: (_) {
                          if (!isDarkTheme) {
                            context.read<ThemesCubit>().toggleTheme();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return FeedbackModalTopSheet();
                    },
                  );
                },
                child: const Text('feedback'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
