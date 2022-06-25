import 'package:TaskMoltaqa/models/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../../networking/api_provider.dart';
import '../../utils/urls.dart';

class ProductsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool _isLoading = false;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  int _pageIndex = 1;
  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  int get pageIndex => _pageIndex;

  bool _isPaginationLoading = false;

  void setIsPaginationLoading(bool value) {
    _isPaginationLoading = value;
    notifyListeners();
  }

  bool get isPaginationLoading => _isPaginationLoading;

  List<ProductData> _productData = [];
  void setProductData(List<ProductData> value) {
    _productData = value;
    notifyListeners();
  }

  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  Future<List<ProductData>> getProductsData() async {
    if (pageIndex != 1) {
      setIsPaginationLoading(true);
    }
    final response = await _apiProvider.get(
      Urls.BASE_URL + Urls.GET_PRODUCTS + "?page=" + pageIndex.toString(),
      headers: {"Accept": "application/json"},
    );

    setIsPaginationLoading(false);

    if (response['status'] == 200) {
      if (pageIndex == 1) {
        if (response['response'] != null) {
          _productModel = ProductModel.fromJson(response['response']);
          print("ssssssssffgghff  ${_productModel?.paginator?.totalPages}");
        }
      }

      if (_productModel != null) {
        Iterable iterable = response['response']['data'];
        _productData
            .addAll(iterable.map((e) => ProductData.fromJson(e)).toList());
      }
    }
    return _productData;
  }
}
