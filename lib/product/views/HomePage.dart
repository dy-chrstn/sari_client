import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:sari/common/utils/theme/colors.dart';
import 'package:sari/common/utils/theme/typography.dart';
import 'package:sari/product/services/product.dart';
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
      Logger().t(products);
      setState(() {
        productList = products;
        Logger().t(productList);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch products')));
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
        body: RefreshIndicator(
          onRefresh: () => fetchProducts(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.dirtyWhite,
                title: Text(
                  'Products',
                  style: AppTypography.heading1
                      .copyWith(color: AppColors.textColor),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // GoRouter.of(context).push('/settings');
                    },
                    icon: const Icon(Icons.info),
                  ),
                ],
                floating: true,
                snap: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(0.0),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(height: screenSize.height * 0.03),
                ),
              ),
              productList.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push('/product/view', extra: {
                                  'userId': widget.userId,
                                  'fields': productList[index],
                                });
                              },
                              child: Card(
                                
                                child: Column(
                                  children: [
                                    Text(productList[index].name),
                                    Text(productList[index].dp.toString()),
                                    
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: productList.length,
                        ),
                      ),
                    )
                  : const SliverFillRemaining(
                      child: SizedBox(
                        child: Center(
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballClipRotateMultiple,
                            colors: [AppColors.primaryColor],
                            strokeWidth: 3,
                            backgroundColor: Colors.transparent,
                            pathBackgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  
                  SliverPadding(padding: EdgeInsets.all(6.0)),
                    // SizedBox(height: screenSize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
