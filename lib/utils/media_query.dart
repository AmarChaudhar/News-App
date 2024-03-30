import 'package:flutter/material.dart';

class MediaQueryUtils {
  static double getWidth(BuildContext context, double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  static double getHeight(BuildContext context, double factor) {
    return MediaQuery.of(context).size.height * factor;
  }
}

class MediaQueriesUtils {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
