import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/product_cache_datasource.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'presentation/viewmodels/product_viewmodel.dart';
import 'presentation/pages/product_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Setup - Injeção de dependência
  final httpClient = http.Client();
  final remoteDatasource = ProductRemoteDatasource(httpClient);
  final cacheDatasource = ProductCacheDatasource();
  final repository = ProductRepositoryImpl(
    remote: remoteDatasource,
    cache: cacheDatasource,
  );
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
