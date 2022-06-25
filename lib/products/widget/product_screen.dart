import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../provider/product_provider.dart';
import 'item_product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    _productData = context.read<ProductsProvider>().getProductsData();
    Future.microtask(() {
      context.read<ProductsProvider>().setIsPaginationLoading(false);
      context.read<ProductsProvider>().setPageIndex(1);
      context.read<ProductsProvider>().setProductData([]);
    });
    super.initState();
  }

  late Future<List<ProductData>> _productData;

  bool onNotification(ScrollEndNotification t) {
    if (t.metrics.atEdge && t.metrics.pixels > 0) {
      scrollDown();
    }
    return true;
  }

  void scrollDown() {
    if (context.read<ProductsProvider>().pageIndex !=
        context.read<ProductsProvider>().productModel!.paginator!.totalPages) {
      context
          .read<ProductsProvider>()
          .setPageIndex(context.read<ProductsProvider>().pageIndex + 1);
      _productData = context.read<ProductsProvider>().getProductsData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductData>>(
        future: _productData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductData>? productDataList = snapshot.data!;
            return NotificationListener(
              onNotification: onNotification,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.count(
                      childAspectRatio: (1 / 1.3),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        productDataList.length,
                        (index) => ItemProduct(
                          productName: productDataList[index].name.toString(),
                          productPrice: productDataList[index].price.toString(),
                          productSalePrice: productDataList[index].salePrice,
                          productSalePercentage:
                              productDataList[index].salePercentage,
                          brandProductName: productDataList[index].brand?.name,
                          productImage: productDataList[index].image,
                          productPriceSymbol:
                              productDataList[index].priceSymbol.toString(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (context
                        .watch<ProductsProvider>()
                        .isPaginationLoading) ...{
                      const SizedBox(height: 10),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    }
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
