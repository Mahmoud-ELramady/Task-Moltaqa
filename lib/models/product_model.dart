class ProductModel {
  bool? status;
  int? code;
  String? message;
  List<ProductData>? data;
  Paginator? paginator;

  ProductModel(
      {this.status, this.code, this.message, this.data, this.paginator});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? Paginator.fromJson(json['paginator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (paginator != null) {
      data['paginator'] = paginator!.toJson();
    }
    return data;
  }
}

class ProductData {
  int? id;
  String? name;
  String? sku;
  String? image;
  bool? isOutOfStock;
  bool? storehouseManagement;
  dynamic quantity;
  dynamic views;
  dynamic reviewsCount;
  dynamic reviewsAvg;
  bool? isFavorite;
  dynamic price;
  dynamic salePrice;
  String? priceSymbol;
  String? salePercentage;
  bool? isProductOnSale;
  Brand? brand;
  String? createdAt;
  String? updatedAt;

  ProductData(
      {this.id,
      this.name,
      this.sku,
      this.image,
      this.isOutOfStock,
      this.storehouseManagement,
      this.quantity,
      this.views,
      this.reviewsCount,
      this.reviewsAvg,
      this.isFavorite,
      this.price,
      this.salePrice,
      this.priceSymbol,
      this.salePercentage,
      this.isProductOnSale,
      this.brand,
      this.createdAt,
      this.updatedAt});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    image = json['image'];
    isOutOfStock = json['is_out_of_stock'];
    storehouseManagement = json['storehouse_management'];
    quantity = json['quantity'];
    views = json['views'];
    reviewsCount = json['reviews_count'];
    reviewsAvg = json['reviews_avg'];
    isFavorite = json['is_favorite'];
    price = json['price'];
    salePrice = json['sale_price'];
    priceSymbol = json['price_symbol'];
    salePercentage = json['sale_percentage'];
    isProductOnSale = json['is_product_on_sale'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['sku'] = sku;
    data['image'] = image;
    data['is_out_of_stock'] = isOutOfStock;
    data['storehouse_management'] = storehouseManagement;
    data['quantity'] = quantity;
    data['views'] = views;
    data['reviews_count'] = reviewsCount;
    data['reviews_avg'] = reviewsAvg;
    data['is_favorite'] = isFavorite;
    data['price'] = price;
    data['sale_price'] = salePrice;
    data['price_symbol'] = priceSymbol;
    data['sale_percentage'] = salePercentage;
    data['is_product_on_sale'] = isProductOnSale;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Brand {
  dynamic id;
  String? name;
  String? logo;

  Brand({this.id, this.name, this.logo});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}

class Paginator {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? perPage;

  Paginator({this.totalCount, this.totalPages, this.currentPage, this.perPage});

  Paginator.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['total_pages'] = totalPages;
    data['current_page'] = currentPage;
    data['per_page'] = perPage;
    return data;
  }
}
