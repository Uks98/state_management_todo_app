import 'package:flutter/material.dart';
import 'package:state_manage_todo_app/common/theme/shadows/abs_theme_shadows.dart';
import 'package:state_manage_todo_app/common/theme/shadows/dart_app_shadows.dart';

import '../constant/app_colors.dart';
import 'color/abs_theme_colors.dart';
import 'color/dark_app_colors.dart';
import 'color/light_app_colors.dart';
import 'shadows/light_app_shadows.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    DarkAppShadows(),
  ),
  light(
    LightAppColors(),
    LightAppShadows(),
  );

  const CustomTheme(this.appColors, this.appShadows);

  final AbstractThemeColors appColors;
  final AbsThemeShadows appShadows;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
    }
  }
}

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    // textTheme: CustomGoogleFonts.diphylleiaTextTheme(
    //   ThemeData(brightness: Brightness.light).textTheme,
    // ),
    colorScheme: ColorScheme.fromSeed(seedColor: CustomTheme.light.appColors.seedColor));

const darkColorSeed = Color(0xbcd5ff7e);
ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.veryDarkGrey,
    // textTheme: GoogleFonts.nanumMyeongjoTextTheme(
    //   ThemeData(brightness: Brightness.dark).textTheme,
    // ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: CustomTheme.dark.appColors.seedColor, brightness: Brightness.dark));
