import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'presentation/viewmodels/product_viewmodel.dart';
import 'presentation/pages/product_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Setup - Injeção de dependência
  final httpClient = http.Client();
  final datasource = ProductRemoteDatasource(httpClient);
  final repository = ProductRepositoryImpl(datasource);
  final viewModel = ProductViewModel(repository);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final ProductViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProductPage(viewModel: viewModel),
    );
  }
}

// Classes originais mantidas (não removidas)
class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String image;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      image: json["image"],
    );
  }
}
