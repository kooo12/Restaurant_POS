import 'package:flutter/material.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class TpsTextFormFieldTheme {
  TpsTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TpsColors.darkGrey,
    suffixIconColor: TpsColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TpsSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: TpsSizes.fontSizeMd, color: TpsColors.darkGrey),
    hintStyle: const TextStyle().copyWith(
        fontSize: TpsSizes.fontSizeSm, color: TpsColors.darkGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TpsColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TpsColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TpsColors.darkGrey,
    suffixIconColor: TpsColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TpsSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: TpsSizes.fontSizeMd, color: TpsColors.darkGrey),
    hintStyle: const TextStyle().copyWith(
        fontSize: TpsSizes.fontSizeSm, color: TpsColors.darkGrey),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TpsColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TpsColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TpsColors.warning),
    ),
  );
}
