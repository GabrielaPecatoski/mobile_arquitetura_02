import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/product_model.dart';

class ProductRemoteDatasource {
  final http.Client client;
  ProductRemoteDatasource(this.client);

  Future<List<ProductModel>> getProducts() async {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? 'https://fakestoreapi.com';
    final response = await client.get(Uri.parse("$baseUrl/products"));

    final List data = json.decode(response.body);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
