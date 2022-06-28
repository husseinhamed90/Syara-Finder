import '../entities/BrandEntity.dart';

abstract class BrandsAndModelsRepository{
  Future<List<BrandEntity>> fetchBrands();
}