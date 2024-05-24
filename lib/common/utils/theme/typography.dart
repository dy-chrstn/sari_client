import 'package:flutter/material.dart';
import 'package:sari/common/utils/theme/colors.dart';
import 'package:sari/common/utils/theme/constants.dart';

class AppTypography {
  static const TextStyle heading1 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstants.fontFamily
  );

  static const TextStyle bodyText = TextStyle(
    color: AppColors.primaryColor,
    fontFamily: AppConstants.fontFamily,
    fontSize: 16,
  );
}