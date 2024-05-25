import 'package:flutter/material.dart';
import '../../common/utils/theme/colors.dart';
import '../../common/utils/theme/typography.dart';
import '../model/product.dart';

class ProductView extends StatefulWidget {
  final String userId;
  final ProductModel fields;
  const ProductView({super.key, required this.userId, required this.fields});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late String productName;
  late double productDp;
  late double productSrp;

  @override
  void initState() {
    super.initState();
    productName = widget.fields.name;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Product View',
                style: AppTypography.heading1,
              ),
              Text(
                'Product Name: $productName',
                style: AppTypography.bodyText,
              ),
              Text(
                'DP: $productDp',
                style: AppTypography.bodyText,
              ),
              Text(
                'SRP: $productSrp',
                style: AppTypography.bodyText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
