import 'package:farm_market/domain/ProductService/product_repository.dart';
import 'package:farm_market/domain/ProductService/product.dart';

class MockProductRepository implements ProductRepository{

  List<Product> _products = [



  ];

  Future<List<Product>> getProducts() async {

    return _products;

  }
  Future<void> addProduct(Product product) async {

  }
  Future<void> loadProducts() async {

  }
  Future<void> saveProducts() async {

  }

}