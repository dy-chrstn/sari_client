import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sari/common/page/Settings.dart';
import 'package:sari/common/utils/theme/colors.dart';
import 'package:sari/common/utils/theme/typography.dart';
import 'package:sari/product/services/product.dart';
import 'package:sari/product/views/ProductView.dart';

import '../model/product.dart';

class HomePage extends StatefulWidget {
  final String userId;
  final String name;
  const HomePage({Key? key, required this.userId, required this.name})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ProductModel> productList = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await getProductList(widget.userId);
      // Logger().d('Products: $products');
      setState(() {
        productList = products;
      });
    } catch (e) {
      // Logger().e('Failed to fetch products: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to fetch products')));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            GoRouter.of(context).push('/product/view');
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: AppColors.dirtyWhite),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.dirtyWhite,
          title: Text(
            'Products',
            style: AppTypography.heading1.copyWith(color: AppColors.textColor),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // GoRouter.of(context).push('/settings');
              },
              icon: const Icon(Icons.info),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.delayed(Duration(seconds: 1), fetchProducts), // Wrap fetchProducts in a Future constructor
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.03),
                productList.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: productList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Text( productList[index].name),
                                Text( productList[index].dp.toString()),
                                Text( productList[index].srp.toString()),
                                // Text( productList[index].prices.toString()),
                              ],
                            )
                          );
                        },
                      )
                    : const Center(child: CircularProgressIndicator()), // Show a loading indicator while fetching products
              ],
            ),
          ),
        ),
      ),
    );
  }
}
