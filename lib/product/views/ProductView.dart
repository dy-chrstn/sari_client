import 'package:flutter/material.dart';

import '../../common/utils/theme/colors.dart';
import '../../common/utils/theme/typography.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Product View',
          style: AppTypography.heading1,
        ),
      ),
    ));
  }
}