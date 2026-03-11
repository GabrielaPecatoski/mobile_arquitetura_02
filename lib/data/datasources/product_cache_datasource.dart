import '../models/product_model.dart';

class ProductCacheDatasource {
  List<ProductModel>? _cachedProducts;

  void save(List<ProductModel> products) {
    _cachedProducts = products;
  }

  List<ProductModel>? get() {
    return _cachedProducts;
  }
}
