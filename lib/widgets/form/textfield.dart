
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sari/utils/theme/colors.dart';
import 'package:sari/utils/theme/constants.dart';

class AppForm {
  static const InputDecoration whiteField = InputDecoration(
    filled: true,
    fillColor: AppColors.dirtyWhite,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppConstants.borderRadius)),
    ),
  );

  static ButtonStyle darkButton = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
    )
  );
}