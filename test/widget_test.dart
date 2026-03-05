// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:product_app/data/datasources/product_remote_datasource.dart';
import 'package:product_app/data/repositories/product_repository_impl.dart';
import 'package:product_app/presentation/viewmodels/product_viewmodel.dart';
import 'package:product_app/presentation/pages/product_page.dart';

void main() {
  testWidgets('Product page displays products', (WidgetTester tester) async {
    // Setup - Injeção de dependência para teste
    final httpClient = http.Client();
    final datasource = ProductRemoteDatasource(httpClient);
    final repository = ProductRepositoryImpl(datasource);
    final viewModel = ProductViewModel(repository);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(home: ProductPage(viewModel: viewModel)),
    );

    // Verify that the app bar title is displayed
    expect(find.text('Products'), findsOneWidget);
  });
}
