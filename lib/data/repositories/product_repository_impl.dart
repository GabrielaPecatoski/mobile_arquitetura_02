import '../../core/errors/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_cache_datasource.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remote;
  final ProductCacheDatasource cache;

  ProductRepositoryImpl({required this.remote, required this.cache});

  @override
  Future<List<Product>> getProducts() async {
    try {
      // Tentar buscar da API
      final models = await remote.getProducts();

      // Salvar no cache
      cache.save(models);

      // Retornar produtos convertidos para entidade Product
      return models
          .map(
            (m) => Product(
              id: m.id,
              title: m.title,
              price: m.price,
              image: m.image,
            ),
          )
          .toList();
    } catch (e) {
      // Se ocorrer erro, verificar cache
      final cachedModels = cache.get();

      if (cachedModels != null && cachedModels.isNotEmpty) {
        // Se houver dados no cache, retornar
        return cachedModels
            .map(
              (m) => Product(
                id: m.id,
                title: m.title,
                price: m.price,
                image: m.image,
              ),
            )
            .toList();
      }

      // Se não houver cache, lançar Failure
      throw Failure("Não foi possível carregar os produtos");
    }
  }
}
