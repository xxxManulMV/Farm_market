import 'package:farm_market/domain/ProductService/product.dart';

abstract class ProductRepository{
  Future<List<Product>> getProducts();
  Future<void> addProduct(Product product);
  Future<void> loadProducts();
  Future<void> saveProducts();
}