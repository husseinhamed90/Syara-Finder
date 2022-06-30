import '../../data/models/Car.dart';
import '../entities/BrandEntity.dart';

abstract class BrandsAndModelsRepository{
  Future<List<BrandEntity>> fetchBrands();
  Future<List<Car>> fetchCars();
}