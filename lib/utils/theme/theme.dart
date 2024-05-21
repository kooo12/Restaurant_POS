import 'package:flutter/material.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/theme/widgets_theme/checkbox_theme.dart';
import 'package:restruant_pos/utils/theme/widgets_theme/elevated_button_theme.dart';
import 'package:restruant_pos/utils/theme/widgets_theme/text_field_theme.dart';
import 'package:restruant_pos/utils/theme/widgets_theme/text_theme.dart';

class TpsTheme {
  TpsTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: TpsColors.primary,
    textTheme: TpsTextTheme.lightTextTheme,
    scaffoldBackgroundColor: TpsColors.white,
    elevatedButtonTheme: TpsElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TpsTextFormFieldTheme.lightInputDecorationTheme,
    checkboxTheme: TpsCheckboxTheme.lightCheckboxTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: TpsColors.primary,
    textTheme: TpsTextTheme.darkTextTheme,
    scaffoldBackgroundColor: TpsColors.dark,
    elevatedButtonTheme: TpsElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TpsTextFormFieldTheme.darkInputDecorationTheme,
    checkboxTheme: TpsCheckboxTheme.darkCheckboxTheme
  );
}